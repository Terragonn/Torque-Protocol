/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */
import { Signer, utils, Contract, ContractFactory, Overrides } from "ethers";
import { Provider, TransactionRequest } from "@ethersproject/providers";
import type { Resolver, ResolverInterface } from "../Resolver";

const _abi = [
  {
    inputs: [
      {
        internalType: "address",
        name: "pokeMe_",
        type: "address",
      },
      {
        internalType: "contract MarginLong",
        name: "marginLong_",
        type: "address",
      },
      {
        internalType: "contract LPool",
        name: "pool_",
        type: "address",
      },
      {
        internalType: "contract IConverter",
        name: "converter_",
        type: "address",
      },
    ],
    stateMutability: "nonpayable",
    type: "constructor",
  },
  {
    inputs: [],
    name: "ETH",
    outputs: [
      {
        internalType: "address",
        name: "",
        type: "address",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "checker",
    outputs: [
      {
        internalType: "bool",
        name: "canExec",
        type: "bool",
      },
      {
        internalType: "bytes",
        name: "execPayload",
        type: "bytes",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "converter",
    outputs: [
      {
        internalType: "contract IConverter",
        name: "",
        type: "address",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "account_",
        type: "address",
      },
    ],
    name: "executorLiquidate",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "account_",
        type: "address",
      },
    ],
    name: "executorReset",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [],
    name: "gelato",
    outputs: [
      {
        internalType: "address payable",
        name: "",
        type: "address",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "marginLong",
    outputs: [
      {
        internalType: "contract MarginLong",
        name: "",
        type: "address",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "pokeMe",
    outputs: [
      {
        internalType: "address",
        name: "",
        type: "address",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "pool",
    outputs: [
      {
        internalType: "contract LPool",
        name: "",
        type: "address",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
];

const _bytecode =
  "0x60c06040523480156200001157600080fd5b506040516200181138038062001811833981016040819052620000349162000143565b83806001600160a01b03166080816001600160a01b031660601b81525050806001600160a01b031663573ea5756040518163ffffffff1660e01b815260040160206040518083038186803b1580156200008c57600080fd5b505afa158015620000a1573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190620000c791906200011d565b60601b6001600160601b03191660a05250600080546001600160a01b03199081166001600160a01b03958616179091556001805482169385169390931790925560028054909216921691909117905550620001c3565b6000602082840312156200012f578081fd5b81516200013c81620001aa565b9392505050565b6000806000806080858703121562000159578283fd5b84516200016681620001aa565b60208601519094506200017981620001aa565b60408601519093506200018c81620001aa565b60608601519092506200019f81620001aa565b939692955090935050565b6001600160a01b0381168114620001c057600080fd5b50565b60805160601c60a05160601c611600620002116000396000818160e201528181610e9d0152610f6201526000818161015d015281816101a0015281816102af01526105d501526116006000f3fe608060405234801561001057600080fd5b50600436106100935760003560e01c806386f041ba1161006657806386f041ba1461011f578063bd38837b14610132578063c570041114610145578063c84eee0d14610158578063cf5303cf1461017f57600080fd5b806316f0115b146100985780633d74d7b3146100c8578063573ea575146100dd5780638322fff214610104575b600080fd5b6001546100ab906001600160a01b031681565b6040516001600160a01b0390911681526020015b60405180910390f35b6100db6100d6366004611274565b610195565b005b6100ab7f000000000000000000000000000000000000000000000000000000000000000081565b6100ab73eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee81565b6000546100ab906001600160a01b031681565b6002546100ab906001600160a01b031681565b6100db610153366004611274565b6102a4565b6100ab7f000000000000000000000000000000000000000000000000000000000000000081565b610187610349565b6040516100bf9291906114a1565b336001600160a01b037f0000000000000000000000000000000000000000000000000000000000000000161461020c5760405162461bcd60e51b8152602060048201526017602482015276506f6b654d6552656164793a206f6e6c79506f6b654d6560481b60448201526064015b60405180910390fd5b600080546040516365189a7b60e11b81526001600160a01b0384811660048301528392169063ca3134f6906024015b600060405180830381600087803b15801561025557600080fd5b505af1158015610269573d6000803e3d6000fd5b505050506040513d6000823e601f3d908101601f19168201604052610291919081019061132c565b9150915061029f82826105d0565b505050565b336001600160a01b037f000000000000000000000000000000000000000000000000000000000000000016146103165760405162461bcd60e51b8152602060048201526017602482015276506f6b654d6552656164793a206f6e6c79506f6b654d6560481b6044820152606401610203565b60008054604051638ac5d4a360e01b81526001600160a01b03848116600483015283921690638ac5d4a39060240161023b565b6000606060008060009054906101000a90046001600160a01b03166001600160a01b0316636847e50b6040518163ffffffff1660e01b815260040160006040518083038186803b15801561039c57600080fd5b505afa1580156103b0573d6000803e3d6000fd5b505050506040513d6000823e601f3d908101601f191682016040526103d89190810190611290565b905060005b81518110156105b457600082828151811061040857634e487b7160e01b600052603260045260246000fd5b6020908102919091010151600054604051600162138f5160e01b031981526001600160a01b03808416600483015292935091169063ffec70af9060240160206040518083038186803b15801561045d57600080fd5b505afa158015610471573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019061049591906113f2565b156104f8576040516001600160a01b03821660248201526001955063c570041160e01b906044015b60408051601f198184030181529190526020810180516001600160e01b03166001600160e01b03199093169290921790915294959350505050565b600054604051630b6eab3760e21b81526001600160a01b03838116600483015290911690632dbaacdc9060240160206040518083038186803b15801561053d57600080fd5b505afa158015610551573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019061057591906113f2565b156105a1576040516001600160a01b038216602482015260019550633d74d7b360e01b906044016104bd565b50806105ac8161156b565b9150506103dd565b5060006040518060200160405280600081525092509250509091565b6000807f00000000000000000000000000000000000000000000000000000000000000006001600160a01b031663b810c6366040518163ffffffff1660e01b8152600401604080518083038186803b15801561062b57600080fd5b505afa15801561063f573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610663919061142a565b9150915060005b8451811015610b845760025485516000916001600160a01b03169063959de0bc908890859081106106ab57634e487b7160e01b600052603260045260246000fd5b60200260200101518785815181106106d357634e487b7160e01b600052603260045260246000fd5b60209081029190910101516040516001600160e01b031960e085901b1681526001600160a01b0392831660048201526024810191909152908616604482015260640160206040518083038186803b15801561072d57600080fd5b505afa158015610741573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906107659190611412565b9050838111156109f45760025486516000916001600160a01b03169063d6e37777908990869081106107a757634e487b7160e01b600052603260045260246000fd5b6020026020010151868987815181106107d057634e487b7160e01b600052603260045260246000fd5b60209081029190910101516040516001600160e01b031960e086901b1681526001600160a01b039384166004820152929091166024830152604482015260640160206040518083038186803b15801561082857600080fd5b505afa15801561083c573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906108609190611412565b90506108bc600260009054906101000a90046001600160a01b03168289868151811061089c57634e487b7160e01b600052603260045260246000fd5b60200260200101516001600160a01b0316610d0a9092919063ffffffff16565b60025487516001600160a01b03909116906305c0d09a908990869081106108f357634e487b7160e01b600052603260045260246000fd5b60209081029190910101516040516001600160e01b031960e084901b1681526001600160a01b039182166004820152602481018590529087166044820152606401602060405180830381600087803b15801561094e57600080fd5b505af1158015610962573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906109869190611412565b506109c1818785815181106109ab57634e487b7160e01b600052603260045260246000fd5b6020026020010151610e6190919063ffffffff16565b8684815181106109e157634e487b7160e01b600052603260045260246000fd5b6020026020010181815250505050610b84565b6002548551610a4f916001600160a01b031690879085908110610a2757634e487b7160e01b600052603260045260246000fd5b602002602001015188858151811061089c57634e487b7160e01b600052603260045260246000fd5b60025486516001600160a01b03909116906305c0d09a90889085908110610a8657634e487b7160e01b600052603260045260246000fd5b6020026020010151878581518110610aae57634e487b7160e01b600052603260045260246000fd5b60209081029190910101516040516001600160e01b031960e085901b1681526001600160a01b03928316600482015260248101919091529086166044820152606401602060405180830381600087803b158015610b0a57600080fd5b505af1158015610b1e573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610b429190611412565b506000858381518110610b6557634e487b7160e01b600052603260045260246000fd5b6020026020010181815250505080610b7c8161156b565b91505061066a565b50610b8f8282610e74565b60005b8451811015610d03576000848281518110610bbd57634e487b7160e01b600052603260045260246000fd5b60200260200101511115610cf1576001548451610c26916001600160a01b031690869084908110610bfe57634e487b7160e01b600052603260045260246000fd5b602002602001015187848151811061089c57634e487b7160e01b600052603260045260246000fd5b60015485516001600160a01b03909116906347e7ef2490879084908110610c5d57634e487b7160e01b600052603260045260246000fd5b6020026020010151868481518110610c8557634e487b7160e01b600052603260045260246000fd5b60200260200101516040518363ffffffff1660e01b8152600401610cbe9291906001600160a01b03929092168252602082015260400190565b600060405180830381600087803b158015610cd857600080fd5b505af1158015610cec573d6000803e3d6000fd5b505050505b80610cfb8161156b565b915050610b92565b5050505050565b801580610d935750604051636eb1769f60e11b81523060048201526001600160a01b03838116602483015284169063dd62ed3e9060440160206040518083038186803b158015610d5957600080fd5b505afa158015610d6d573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610d919190611412565b155b610dfe5760405162461bcd60e51b815260206004820152603660248201527f5361666545524332303a20617070726f76652066726f6d206e6f6e2d7a65726f60448201527520746f206e6f6e2d7a65726f20616c6c6f77616e636560501b6064820152608401610203565b6040516001600160a01b03831660248201526044810182905261029f90849063095ea7b360e01b906064015b60408051601f198184030181529190526020810180516001600160e01b03166001600160e01b031990931692909217909152610f8b565b6000610e6d8284611524565b9392505050565b6001600160a01b03811673eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee1415610f5c5760007f00000000000000000000000000000000000000000000000000000000000000006001600160a01b03168360405160006040518083038185875af1925050503d8060008114610f06576040519150601f19603f3d011682016040523d82523d6000602084013e610f0b565b606091505b505090508061029f5760405162461bcd60e51b815260206004820152601e60248201527f5f7472616e736665723a20455448207472616e73666572206661696c656400006044820152606401610203565b610f87817f00000000000000000000000000000000000000000000000000000000000000008461105d565b5050565b6000610fe0826040518060400160405280602081526020017f5361666545524332303a206c6f772d6c6576656c2063616c6c206661696c6564815250856001600160a01b031661108d9092919063ffffffff16565b80519091501561029f5780806020019051810190610ffe91906113f2565b61029f5760405162461bcd60e51b815260206004820152602a60248201527f5361666545524332303a204552433230206f7065726174696f6e20646964206e6044820152691bdd081cdd58d8d9595960b21b6064820152608401610203565b6040516001600160a01b03831660248201526044810182905261029f90849063a9059cbb60e01b90606401610e2a565b606061109c84846000856110a4565b949350505050565b6060824710156111055760405162461bcd60e51b815260206004820152602660248201527f416464726573733a20696e73756666696369656e742062616c616e636520666f6044820152651c8818d85b1b60d21b6064820152608401610203565b843b6111535760405162461bcd60e51b815260206004820152601d60248201527f416464726573733a2063616c6c20746f206e6f6e2d636f6e74726163740000006044820152606401610203565b600080866001600160a01b0316858760405161116f9190611485565b60006040518083038185875af1925050503d80600081146111ac576040519150601f19603f3d011682016040523d82523d6000602084013e6111b1565b606091505b50915091506111c18282866111cc565b979650505050505050565b606083156111db575081610e6d565b8251156111eb5782518084602001fd5b8160405162461bcd60e51b815260040161020391906114bc565b600082601f830112611215578081fd5b8151602061122a61122583611500565b6114cf565b80838252828201915082860187848660051b8901011115611249578586fd5b855b858110156112675781518452928401929084019060010161124b565b5090979650505050505050565b600060208284031215611285578081fd5b8135610e6d816115b2565b600060208083850312156112a2578182fd5b825167ffffffffffffffff8111156112b8578283fd5b8301601f810185136112c8578283fd5b80516112d661122582611500565b80828252848201915084840188868560051b87010111156112f5578687fd5b8694505b8385101561132057805161130c816115b2565b8352600194909401939185019185016112f9565b50979650505050505050565b6000806040838503121561133e578081fd5b825167ffffffffffffffff80821115611355578283fd5b818501915085601f830112611368578283fd5b8151602061137861122583611500565b8083825282820191508286018a848660051b8901011115611397578788fd5b8796505b848710156113c25780516113ae816115b2565b83526001969096019591830191830161139b565b50918801519196509093505050808211156113db578283fd5b506113e885828601611205565b9150509250929050565b600060208284031215611403578081fd5b81518015158114610e6d578182fd5b600060208284031215611423578081fd5b5051919050565b6000806040838503121561143c578182fd5b82519150602083015161144e816115b2565b809150509250929050565b6000815180845261147181602086016020860161153b565b601f01601f19169290920160200192915050565b6000825161149781846020870161153b565b9190910192915050565b821515815260406020820152600061109c6040830184611459565b602081526000610e6d6020830184611459565b604051601f8201601f1916810167ffffffffffffffff811182821017156114f8576114f861159c565b604052919050565b600067ffffffffffffffff82111561151a5761151a61159c565b5060051b60200190565b60008282101561153657611536611586565b500390565b60005b8381101561155657818101518382015260200161153e565b83811115611565576000848401525b50505050565b600060001982141561157f5761157f611586565b5060010190565b634e487b7160e01b600052601160045260246000fd5b634e487b7160e01b600052604160045260246000fd5b6001600160a01b03811681146115c757600080fd5b5056fea2646970667358221220129d9824e5ada865099412735e0c8abb83adbcec60b24a8bfaf019889de1dd4d64736f6c63430008040033";

type ResolverConstructorParams =
  | [signer?: Signer]
  | ConstructorParameters<typeof ContractFactory>;

const isSuperArgs = (
  xs: ResolverConstructorParams
): xs is ConstructorParameters<typeof ContractFactory> => xs.length > 1;

export class Resolver__factory extends ContractFactory {
  constructor(...args: ResolverConstructorParams) {
    if (isSuperArgs(args)) {
      super(...args);
    } else {
      super(_abi, _bytecode, args[0]);
    }
    this.contractName = "Resolver";
  }

  deploy(
    pokeMe_: string,
    marginLong_: string,
    pool_: string,
    converter_: string,
    overrides?: Overrides & { from?: string | Promise<string> }
  ): Promise<Resolver> {
    return super.deploy(
      pokeMe_,
      marginLong_,
      pool_,
      converter_,
      overrides || {}
    ) as Promise<Resolver>;
  }
  getDeployTransaction(
    pokeMe_: string,
    marginLong_: string,
    pool_: string,
    converter_: string,
    overrides?: Overrides & { from?: string | Promise<string> }
  ): TransactionRequest {
    return super.getDeployTransaction(
      pokeMe_,
      marginLong_,
      pool_,
      converter_,
      overrides || {}
    );
  }
  attach(address: string): Resolver {
    return super.attach(address) as Resolver;
  }
  connect(signer: Signer): Resolver__factory {
    return super.connect(signer) as Resolver__factory;
  }
  static readonly contractName: "Resolver";
  public readonly contractName: "Resolver";
  static readonly bytecode = _bytecode;
  static readonly abi = _abi;
  static createInterface(): ResolverInterface {
    return new utils.Interface(_abi) as ResolverInterface;
  }
  static connect(
    address: string,
    signerOrProvider: Signer | Provider
  ): Resolver {
    return new Contract(address, _abi, signerOrProvider) as Resolver;
  }
}
