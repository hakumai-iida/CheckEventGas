//
//  CheckEvent.swift
//  CheckEventGas
//
//  Created by 飯田白米 on 2020/03/18.
//  Copyright © 2020 飯田白米. All rights reserved.
//

import Foundation
import UIKit
import BigInt
import web3swift

//-------------------------------------------------------------
// [CheckEvent.sol]
//-------------------------------------------------------------
class CheckEvent {
    //--------------------------------
    // [abi]ファイルの内容
    //--------------------------------
    static internal let AbiString = """
[
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "address",
        "name": "from",
        "type": "address"
      }
    ],
    "name": "Ev0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "internalType": "address",
        "name": "nonIndexedFrom",
        "type": "address"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val1",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val2",
        "type": "uint256"
      }
    ],
    "name": "EvIndexedArg0",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "address",
        "name": "from",
        "type": "address"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val1",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val2",
        "type": "uint256"
      }
    ],
    "name": "EvIndexedArg1",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "address",
        "name": "from",
        "type": "address"
      },
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "indexedVal1",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val2",
        "type": "uint256"
      }
    ],
    "name": "EvIndexedArg2",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "address",
        "name": "from",
        "type": "address"
      },
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "indexedVal1",
        "type": "uint256"
      },
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "indexedVal2",
        "type": "uint256"
      }
    ],
    "name": "EvIndexedArg3",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val1",
        "type": "uint256"
      },
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "indexedVal2",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val3",
        "type": "uint256"
      },
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "indexedVal4",
        "type": "uint256"
      },
      {
        "indexed": true,
        "internalType": "address",
        "name": "from",
        "type": "address"
      }
    ],
    "name": "EvJumpingIndexedArg",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "address",
        "name": "from",
        "type": "address"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "valPacked",
        "type": "uint256"
      }
    ],
    "name": "EvPackedVal",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "address",
        "name": "from",
        "type": "address"
      },
      {
        "indexed": false,
        "internalType": "uint32",
        "name": "val1",
        "type": "uint32"
      },
      {
        "indexed": false,
        "internalType": "uint32",
        "name": "val2",
        "type": "uint32"
      },
      {
        "indexed": false,
        "internalType": "uint32",
        "name": "val3",
        "type": "uint32"
      },
      {
        "indexed": false,
        "internalType": "uint32",
        "name": "val4",
        "type": "uint32"
      }
    ],
    "name": "EvUint32Val4",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "address",
        "name": "from",
        "type": "address"
      }
    ],
    "name": "EvVal0",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "address",
        "name": "from",
        "type": "address"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val1",
        "type": "uint256"
      }
    ],
    "name": "EvVal1",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "address",
        "name": "from",
        "type": "address"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val1",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val2",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val3",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val4",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val5",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val6",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val7",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val8",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val9",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val10",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val11",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val12",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val13",
        "type": "uint256"
      }
    ],
    "name": "EvVal13",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "address",
        "name": "from",
        "type": "address"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val1",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val2",
        "type": "uint256"
      }
    ],
    "name": "EvVal2",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "address",
        "name": "from",
        "type": "address"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val1",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val2",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val3",
        "type": "uint256"
      }
    ],
    "name": "EvVal3",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "address",
        "name": "from",
        "type": "address"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val1",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val2",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val3",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "val4",
        "type": "uint256"
      }
    ],
    "name": "EvVal4",
    "type": "event"
  },
  {
    "constant": false,
    "inputs": [],
    "name": "callEvVal0",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "internalType": "uint256",
        "name": "val1",
        "type": "uint256"
      }
    ],
    "name": "callEvVal1",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "internalType": "uint256",
        "name": "val1",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "val2",
        "type": "uint256"
      }
    ],
    "name": "callEvVal2",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "internalType": "uint256",
        "name": "val1",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "val2",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "val3",
        "type": "uint256"
      }
    ],
    "name": "callEvVal3",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "internalType": "uint256",
        "name": "val1",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "val2",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "val3",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "val4",
        "type": "uint256"
      }
    ],
    "name": "callEvVal4",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "internalType": "uint256",
        "name": "val",
        "type": "uint256"
      }
    ],
    "name": "callEvVal13",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "internalType": "uint32",
        "name": "val1",
        "type": "uint32"
      },
      {
        "internalType": "uint32",
        "name": "val2",
        "type": "uint32"
      },
      {
        "internalType": "uint32",
        "name": "val3",
        "type": "uint32"
      },
      {
        "internalType": "uint32",
        "name": "val4",
        "type": "uint32"
      }
    ],
    "name": "callEvUint32Val4",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "internalType": "uint32",
        "name": "val1",
        "type": "uint32"
      },
      {
        "internalType": "uint32",
        "name": "val2",
        "type": "uint32"
      },
      {
        "internalType": "uint32",
        "name": "val3",
        "type": "uint32"
      },
      {
        "internalType": "uint32",
        "name": "val4",
        "type": "uint32"
      }
    ],
    "name": "callEvPackedVal",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "internalType": "uint256",
        "name": "val1",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "val2",
        "type": "uint256"
      }
    ],
    "name": "callEvIndexedArg0",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "internalType": "uint256",
        "name": "val1",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "val2",
        "type": "uint256"
      }
    ],
    "name": "callEvIndexedArg1",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "internalType": "uint256",
        "name": "val1",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "val2",
        "type": "uint256"
      }
    ],
    "name": "callEvIndexedArg2",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "internalType": "uint256",
        "name": "val1",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "val2",
        "type": "uint256"
      }
    ],
    "name": "callEvIndexedArg3",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "internalType": "uint256",
        "name": "val1",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "val2",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "val3",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "val4",
        "type": "uint256"
      }
    ],
    "name": "callEvJumpingIndexedArg",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [],
    "name": "callEvLongName64",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  }
]
"""

    //--------------------------------
    // コントラクトの取得
    //--------------------------------
    static public func GetContract( _ helper:Web3Helper ) -> web3.web3contract? {
        var address:String
        
        // FIXME ご自身がデプロイしたコントラクトのアドレスに置き換えてください
        // メモ：[rinkeby]のアドレスは実際に存在するコントラクトなので、そのままでも利用できます
        switch helper.getCurTarget()! {
        case Web3Helper.target.mainnet:
            address = ""
            
        case Web3Helper.target.ropsten:
            address = ""

        case Web3Helper.target.kovan:
            address = ""

        case Web3Helper.target.rinkeby:
            address = "0x4cA3bbb07Fd3a34847e3624A25dDEcF37BfB6B93"
        }
        
        let contractAddress = EthereumAddress( address )
        
        let web3 = helper.getCurWeb3()
        
        let contract = web3!.contract( AbiString, at: contractAddress, abiVersion: 2 )
        
        return contract
    }
    
    //---------------------------------------------------
    // callEvVal0
    //---------------------------------------------------
    public func callEvVal0( _ helper:Web3Helper, password:String ) throws -> String?{
        let contract = CheckEvent.GetContract( helper )
        
        let parameters = [] as [AnyObject]
        let data = Data()
        var options = TransactionOptions.defaultOptions
        options.from = helper.getCurAddress()

        // ブロックチェーンに書き込むので[write]で呼び出す
        let tx = contract!.write( "callEvVal0", parameters: parameters, extraData:data, transactionOptions: options )

        // [wirte]の結果はトランザクションで返る（※この時点ではブロックチェーン上で同期されている保証はない）
        let response = try tx!.sendPromise( password: password ).wait()
        return response.hash ;
    }
    
    //---------------------------------------------------
    // callEvVal1
    //---------------------------------------------------
    public func callEvVal1( _ helper:Web3Helper, password:String ) throws -> String?{
        let contract = CheckEvent.GetContract( helper )
        
        let parameters = [BigUInt(1)] as [AnyObject]
        let data = Data()
        var options = TransactionOptions.defaultOptions
        options.from = helper.getCurAddress()

        // ブロックチェーンに書き込むので[write]で呼び出す
        let tx = contract!.write( "callEvVal1", parameters: parameters, extraData:data, transactionOptions: options )

        // [wirte]の結果はトランザクションで返る（※この時点ではブロックチェーン上で同期されている保証はない）
        let response = try tx!.sendPromise( password: password ).wait()
        return response.hash ;
    }

    //---------------------------------------------------
    // callEvVal2
    //---------------------------------------------------
    public func callEvVal2( _ helper:Web3Helper, password:String ) throws -> String?{
        let contract = CheckEvent.GetContract( helper )
        
        let parameters = [BigUInt(1),BigUInt(2)] as [AnyObject]
        let data = Data()
        var options = TransactionOptions.defaultOptions
        options.from = helper.getCurAddress()

        // ブロックチェーンに書き込むので[write]で呼び出す
        let tx = contract!.write( "callEvVal2", parameters: parameters, extraData:data, transactionOptions: options )

        // [wirte]の結果はトランザクションで返る（※この時点ではブロックチェーン上で同期されている保証はない）
        let response = try tx!.sendPromise( password: password ).wait()
        return response.hash ;
    }
    
    //---------------------------------------------------
    // callEvVal3
    //---------------------------------------------------
    public func callEvVal3( _ helper:Web3Helper, password:String ) throws -> String?{
        let contract = CheckEvent.GetContract( helper )
        
        let parameters = [BigUInt(1),BigUInt(2),BigUInt(3)] as [AnyObject]
        let data = Data()
        var options = TransactionOptions.defaultOptions
        options.from = helper.getCurAddress()

        // ブロックチェーンに書き込むので[write]で呼び出す
        let tx = contract!.write( "callEvVal3", parameters: parameters, extraData:data, transactionOptions: options )

        // [wirte]の結果はトランザクションで返る（※この時点ではブロックチェーン上で同期されている保証はない）
        let response = try tx!.sendPromise( password: password ).wait()
        return response.hash ;
    }
    
    //---------------------------------------------------
    // callEvVal4
    //---------------------------------------------------
    public func callEvVal4( _ helper:Web3Helper, password:String ) throws -> String?{
        let contract = CheckEvent.GetContract( helper )
        
        let parameters = [BigUInt(1),BigUInt(2),BigUInt(3),BigUInt(4)] as [AnyObject]
        let data = Data()
        var options = TransactionOptions.defaultOptions
        options.from = helper.getCurAddress()

        // ブロックチェーンに書き込むので[write]で呼び出す
        let tx = contract!.write( "callEvVal4", parameters: parameters, extraData:data, transactionOptions: options )

        // [wirte]の結果はトランザクションで返る（※この時点ではブロックチェーン上で同期されている保証はない）
        let response = try tx!.sendPromise( password: password ).wait()
        return response.hash ;
    }
    
    //---------------------------------------------------
    // callEvVal13
    //---------------------------------------------------
    public func callEvVal13( _ helper:Web3Helper, password:String ) throws -> String?{
        let contract = CheckEvent.GetContract( helper )
        
        let parameters = [BigUInt(0)] as [AnyObject]
        let data = Data()
        var options = TransactionOptions.defaultOptions
        options.from = helper.getCurAddress()

        // ブロックチェーンに書き込むので[write]で呼び出す
        let tx = contract!.write( "callEvVal13", parameters: parameters, extraData:data, transactionOptions: options )

        // [wirte]の結果はトランザクションで返る（※この時点ではブロックチェーン上で同期されている保証はない）
        let response = try tx!.sendPromise( password: password ).wait()
        return response.hash ;
    }
    
    //---------------------------------------------------
    // callEvUint32Val4
    //---------------------------------------------------
    public func callEvUint32Val4( _ helper:Web3Helper, password:String ) throws -> String?{
        let contract = CheckEvent.GetContract( helper )
        
        let parameters = [UInt32(1),UInt32(2),UInt32(3),UInt32(4)] as [AnyObject]
        let data = Data()
        var options = TransactionOptions.defaultOptions
        options.from = helper.getCurAddress()

        // ブロックチェーンに書き込むので[write]で呼び出す
        let tx = contract!.write( "callEvUint32Val4", parameters: parameters, extraData:data, transactionOptions: options )

        // [wirte]の結果はトランザクションで返る（※この時点ではブロックチェーン上で同期されている保証はない）
        let response = try tx!.sendPromise( password: password ).wait()
        return response.hash ;
    }
    
    //---------------------------------------------------
    // callEvPackedVal
    //---------------------------------------------------
    public func callEvPackedVal( _ helper:Web3Helper, password:String ) throws -> String?{
        let contract = CheckEvent.GetContract( helper )
        
        let parameters = [UInt32(1),UInt32(2),UInt32(3),UInt32(4)] as [AnyObject]
        let data = Data()
        var options = TransactionOptions.defaultOptions
        options.from = helper.getCurAddress()

        // ブロックチェーンに書き込むので[write]で呼び出す
        let tx = contract!.write( "callEvPackedVal", parameters: parameters, extraData:data, transactionOptions: options )

        // [wirte]の結果はトランザクションで返る（※この時点ではブロックチェーン上で同期されている保証はない）
        let response = try tx!.sendPromise( password: password ).wait()
        return response.hash ;
    }
    
    //---------------------------------------------------
    // callEvIndexedArg0
    //---------------------------------------------------
    public func callEvIndexedArg0( _ helper:Web3Helper, password:String ) throws -> String?{
        let contract = CheckEvent.GetContract( helper )
        
        let parameters = [BigUInt(1),BigUInt(2)] as [AnyObject]
        let data = Data()
        var options = TransactionOptions.defaultOptions
        options.from = helper.getCurAddress()

        // ブロックチェーンに書き込むので[write]で呼び出す
        let tx = contract!.write( "callEvIndexedArg0", parameters: parameters, extraData:data, transactionOptions: options )

        // [wirte]の結果はトランザクションで返る（※この時点ではブロックチェーン上で同期されている保証はない）
        let response = try tx!.sendPromise( password: password ).wait()
        return response.hash ;
    }

    //---------------------------------------------------
    // callEvIndexedArg1
    //---------------------------------------------------
    public func callEvIndexedArg1( _ helper:Web3Helper, password:String ) throws -> String?{
        let contract = CheckEvent.GetContract( helper )
        
        let parameters = [BigUInt(1),BigUInt(2)] as [AnyObject]
        let data = Data()
        var options = TransactionOptions.defaultOptions
        options.from = helper.getCurAddress()

        // ブロックチェーンに書き込むので[write]で呼び出す
        let tx = contract!.write( "callEvIndexedArg1", parameters: parameters, extraData:data, transactionOptions: options )

        // [wirte]の結果はトランザクションで返る（※この時点ではブロックチェーン上で同期されている保証はない）
        let response = try tx!.sendPromise( password: password ).wait()
        return response.hash ;
    }

    //---------------------------------------------------
    // callEvIndexedArg2
    //---------------------------------------------------
    public func callEvIndexedArg2( _ helper:Web3Helper, password:String ) throws -> String?{
        let contract = CheckEvent.GetContract( helper )
        
        let parameters = [BigUInt(1),BigUInt(2)] as [AnyObject]
        let data = Data()
        var options = TransactionOptions.defaultOptions
        options.from = helper.getCurAddress()

        // ブロックチェーンに書き込むので[write]で呼び出す
        let tx = contract!.write( "callEvIndexedArg2", parameters: parameters, extraData:data, transactionOptions: options )

        // [wirte]の結果はトランザクションで返る（※この時点ではブロックチェーン上で同期されている保証はない）
        let response = try tx!.sendPromise( password: password ).wait()
        return response.hash ;
    }

    //---------------------------------------------------
    // callEvIndexedArg3
    //---------------------------------------------------
    public func callEvIndexedArg3( _ helper:Web3Helper, password:String ) throws -> String?{
        let contract = CheckEvent.GetContract( helper )
        
        let parameters = [BigUInt(1),BigUInt(2)] as [AnyObject]
        let data = Data()
        var options = TransactionOptions.defaultOptions
        options.from = helper.getCurAddress()

        // ブロックチェーンに書き込むので[write]で呼び出す
        let tx = contract!.write( "callEvIndexedArg3", parameters: parameters, extraData:data, transactionOptions: options )

        // [wirte]の結果はトランザクションで返る（※この時点ではブロックチェーン上で同期されている保証はない）
        let response = try tx!.sendPromise( password: password ).wait()
        return response.hash ;
    }
    
    //---------------------------------------------------
    // callEvJumpingIndexedArg
    //---------------------------------------------------
    public func callEvJumpingIndexedArg( _ helper:Web3Helper, password:String ) throws -> String?{
        let contract = CheckEvent.GetContract( helper )
        
        let parameters = [BigUInt(1),BigUInt(2),BigUInt(3),BigUInt(4)] as [AnyObject]
        let data = Data()
        var options = TransactionOptions.defaultOptions
        options.from = helper.getCurAddress()

        // ブロックチェーンに書き込むので[write]で呼び出す
        let tx = contract!.write( "callEvJumpingIndexedArg", parameters: parameters, extraData:data, transactionOptions: options )

        // [wirte]の結果はトランザクションで返る（※この時点ではブロックチェーン上で同期されている保証はない）
        let response = try tx!.sendPromise( password: password ).wait()
        return response.hash ;
    }

    //---------------------------------------------------
    // callEvLongName64
    //---------------------------------------------------
    public func callEvLongName64( _ helper:Web3Helper, password:String ) throws -> String?{
        let contract = CheckEvent.GetContract( helper )
        
        let parameters = [] as [AnyObject]
        let data = Data()
        var options = TransactionOptions.defaultOptions
        options.from = helper.getCurAddress()

        // ブロックチェーンに書き込むので[write]で呼び出す
        let tx = contract!.write( "callEvLongName64", parameters: parameters, extraData:data, transactionOptions: options )

        // [wirte]の結果はトランザクションで返る（※この時点ではブロックチェーン上で同期されている保証はない）
        let response = try tx!.sendPromise( password: password ).wait()
        return response.hash ;
    }
}
