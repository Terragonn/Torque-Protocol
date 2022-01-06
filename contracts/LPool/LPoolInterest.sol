//SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "../lib/FractionMath.sol";
import "./LPoolLiquidity.sol";

abstract contract LPoolInterest is LPoolLiquidity {
    using SafeMath for uint256;

    uint256 public blocksPerCompound;

    mapping(IERC20 => FractionMath.Fraction) private _maxInterestMin;
    mapping(IERC20 => FractionMath.Fraction) private _maxInterestMax;

    mapping(IERC20 => FractionMath.Fraction) private _maxUtilization;

    constructor(uint256 blocksPerCompound_) {
        blocksPerCompound = blocksPerCompound_;
    }

    // Set the blocks per compound
    function setBlocksPerCompound(uint256 blocksPerCompound_) external onlyRole(POOL_ADMIN) {
        blocksPerCompound = blocksPerCompound_;
    }

    // Get the max interest for minimum utilization for the given token
    function maxInterestMin(IERC20 token_) public view returns (uint256, uint256) {
        return (_maxInterestMin[token_].numerator, _maxInterestMin[token_].denominator);
    }

    // Set the max interest for minimum utilization for the given token
    function setMaxInterestMin(
        IERC20[] memory token_,
        uint256[] memory percentNumerator_,
        uint256[] memory percentDenominator_
    ) external onlyRole(POOL_ADMIN) {
        for (uint256 i = 0; i < token_.length; i++) {
            if (isPA(token_[i])) {
                _maxInterestMin[token_[i]].numerator = percentNumerator_[i];
                _maxInterestMin[token_[i]].denominator = percentDenominator_[i];
            }
        }
    }

    // Get the max interest for maximum utilization for the given token
    function maxInterestMax(IERC20 token_) public view returns (uint256, uint256) {
        return (_maxInterestMax[token_].numerator, _maxInterestMax[token_].denominator);
    }

    // Set the max interest for maximum utilization for the given token
    function setMaxInterestMax(
        IERC20[] memory token_,
        uint256[] memory percentNumerator_,
        uint256[] memory percentDenominator_
    ) external onlyRole(POOL_ADMIN) {
        for (uint256 i = 0; i < token_.length; i++) {
            if (isPA(token_[i])) {
                _maxInterestMax[token_[i]].numerator = percentNumerator_[i];
                _maxInterestMax[token_[i]].denominator = percentDenominator_[i];
            }
        }
    }

    // Get the max utilization threshold for the given token
    function maxUtilization(IERC20 token_) public view returns (uint256, uint256) {
        return (_maxUtilization[token_].numerator, _maxUtilization[token_].denominator);
    }

    // Set the max utilization threshold for the given token
    function setMaxUtilization(
        IERC20[] memory token_,
        uint256[] memory percentNumerator_,
        uint256[] memory percentDenominator_
    ) external onlyRole(POOL_ADMIN) {
        for (uint256 i = 0; i < token_.length; i++) {
            if (isPA(token_[i])) {
                _maxUtilization[token_[i]].numerator = percentNumerator_[i];
                _maxUtilization[token_[i]].denominator = percentDenominator_[i];
            }
        }
    }

    // Helper to calculate the minimum interest rate
    function _interestRateMin(
        uint256 utilized_,
        uint256 valueLocked_,
        FractionMath.Fraction memory interestMin_
    ) internal pure returns (uint256, uint256) {
        return (utilized_.mul(interestMin_.numerator), valueLocked_.mul(interestMin_.denominator));
    }

    // Helper to calculate the maximum interest rate
    function _interestRateMax(
        uint256 utilized_,
        uint256 valueLocked_,
        FractionMath.Fraction memory utilizationMax_,
        FractionMath.Fraction memory interestMin_,
        FractionMath.Fraction memory interestMax_
    ) internal pure returns (uint256, uint256) {
        uint256 kNumerator;
        {
            kNumerator = interestMax_.numerator.add(interestMin_.denominator).sub(interestMin_.numerator.mul(interestMax_.denominator)).mul(utilizationMax_.numerator);
        }
        uint256 kDenominator;
        {
            kDenominator = interestMax_.denominator.mul(interestMin_.denominator).mul(utilizationMax_.denominator);
        }

        uint256 numerator;
        {
            numerator = utilized_.mul(interestMax_.numerator).mul(kDenominator).sub(kNumerator.mul(valueLocked_).mul(interestMax_.denominator));
        }
        uint256 denominator;
        {
            denominator = valueLocked_.mul(interestMax_.denominator).mul(kDenominator);
        }

        return (numerator, denominator);
    }

    // Get the interest rate (in terms of numerator and denominator of ratio) for a given asset per compound
    function interestRate(IERC20 token_) public view returns (uint256, uint256) {
        uint256 valueLocked = tvl(token_);
        uint256 utilized = valueLocked.sub(liquidity(token_));

        FractionMath.Fraction memory utilizationMax = _maxUtilization[token_];
        FractionMath.Fraction memory interestMin = _maxInterestMin[token_];
        FractionMath.Fraction memory interestMax = _maxInterestMin[token_];

        if (utilized.mul(utilizationMax.denominator) > tvl(token_).mul(utilizationMax.numerator))
            return _interestRateMax(utilized, valueLocked, utilizationMax, interestMin, interestMax);
        else return _interestRateMin(utilized, valueLocked, interestMin);
    }

    // Get the interest on a given asset for a given number of blocks
    function interest(
        IERC20 token_,
        uint256 initialBorrow_,
        uint256 borrowBlock_
    ) external view returns (uint256) {
        uint256 blocksSinceBorrow = block.number.sub(borrowBlock_);
        (uint256 interestRateNumerator, uint256 interestRateDenominator) = interestRate(token_);
        uint256 precision = 12; // Precision is calculated as the log of the maximum expected number of blocks borrowed for
        return FractionMath.fracExp(initialBorrow_, blocksPerCompound.mul(interestRateDenominator).div(interestRateNumerator), blocksSinceBorrow, precision);
    }
}
