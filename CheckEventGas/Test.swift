//
//  Test.swift
//  CheckEventGas
//
//  Created by 飯田白米 on 2020/03/18.
//  Copyright © 2020 飯田白米. All rights reserved.
//

import Foundation
import UIKit
import BigInt
import web3swift

class Test {
    //-------------------------
    // メンバー
    //-------------------------
    let helper: Web3Helper              // [web3swift]利用のためのヘルパー
    let keyFile: String                 // 直近に作成されたキーストアを保持するファイル
    let password: String                // アカウント作成時のパスワード
    let targetNet: Web3Helper.target    // 接続先
    var isBusy = false                  // 重複呼び出し回避用
    
    //-------------------------
    // イニシャライザ
    //-------------------------
    public init(){
        // ヘルパー作成
        self.helper = Web3Helper()
    
        // キーストアファイル
        self.keyFile = "key.json"

        // FIXME ご自身のパスワードで置き換えてください
        // メモ：このコードはテスト用なのでソース内にパスワードを書いていますが、
        //      公開を前提としたアプリを作る場合、ソース内にパスワードを書くことは大変危険です！
        self.password = "password"
                
        // FIXME ご自身のテストに合わせて接続先を変更してください
        self.targetNet = Web3Helper.target.rinkeby
    }
        
    //-------------------------
    // テストの開始
    //-------------------------
    public func test() {
        // テスト中なら無視
        if( self.isBusy ){
            print( "@ TestWeb3Swift: busy!" )
            return;
        }
        self.isBusy = true;
        
        // キュー（メインとは別のスレッド）で処理する
        let queue = OperationQueue()
        queue.addOperation {
            self.execTest()
            self.isBusy = false;
        }
    }

    //-------------------------
    // テストの開始
    //-------------------------
    func execTest() {
        print( "@--------------------------" )
        print( "@ CheckEventGas: start..." )
        print( "@--------------------------" )

        do{
            // ヘルパーが無効であれば
            if !self.helper.isValid() {
                // 接続先の設定ととキーストアの読み込み（なければ新規作成）
                self.setTarget()
                self.setKeystore()
            }

            // 用心（※この時点でヘルパーが有効でないのは困る）
            if !self.helper.isValid(){
                print( "@ Web3Hlper is INVALID" )
                return
            }
            
            print( "@ Web3Helper is READY" )

            // 残高(ETH)の確認
            self.checkBalance()
            
            // チェックイベントの確認
            try self.checkEvent()
        } catch {
            print( "@ CheckEventGas: error:", error )
        }
        
        print( "@--------------------------" )
        print( "@ CheckEventGas: finished" )
        print( "@--------------------------" )
    }
    
    //-----------------------------------------
    // JSONファイルの保存
    //-----------------------------------------
    func saveKeystoreJson( json : String ) -> Bool{
        let userDir = NSSearchPathForDirectoriesInDomains( .documentDirectory, .userDomainMask, true )[0]
        let keyPath = userDir + "/" + self.keyFile
        return FileManager.default.createFile( atPath: keyPath, contents: json.data( using: .ascii ), attributes: nil )
    }
    
    //-----------------------------------------
    // JSONファイルの読み込み
    //-----------------------------------------
    func loadKeystoreJson() -> String?{
        let userDir = NSSearchPathForDirectoriesInDomains( .documentDirectory, .userDomainMask, true )[0]
        let keyPath = userDir + "/" + self.keyFile
        return try? String( contentsOfFile: keyPath, encoding: String.Encoding.ascii )
    }

    //-----------------------------------------
    // 接続先設定
    //-----------------------------------------
    func setTarget(){
        print( "@------------------" )
        print( "@ setTarget" )
        print( "@------------------" )
        _ = self.helper.setTarget( target: self.targetNet )
        
        let target = self.helper.getCurTarget()
        print( "@ target:", target! )
    }

    //-----------------------------------------
    // キーストア設定
    //-----------------------------------------
    func setKeystore() {
        print( "@------------------" )
        print( "@ setKeystore" )
        print( "@------------------" )

        // キーストアのファイルを読み込む
        if let json = self.loadKeystoreJson(){
            print( "@ loadKeystoreJson: json=", json )

            let result = helper.loadKeystore( json: json )
            print( "@ loadKeystore: result=", result )
        }
        
        // この時点でヘルパーが無効であれば新規キーストアの作成
        if !helper.isValid() {
            if helper.createNewKeystore(password: self.password){
                print( "@ CREATE NEW KEYSTORE" )
                
                let json = helper.getCurKeystoreJson()
                print( "@ Write down below json code to import generated account into your wallet apps(e.g. MetaMask)" )
                print( json! )

                let privateKey = helper.getCurPrivateKey( password : self.password )
                print( "@ privateKey:", privateKey! )

                // 出力
                let result = self.saveKeystoreJson( json: json! )
                print( "@ saveKeystoreJson: result=", result )
            }
        }

        // イーサリアムアドレスの確認
        let ethereumAddress = helper.getCurEthereumAddress()
        print( "@ CURRENT KEYSTORE" )
        print( "@ ethereumAddress:", ethereumAddress! )
    }
    
    //------------------------
    // 残高確認
    //------------------------
    func checkBalance() {
        print( "@------------------" )
        print( "@ checkBalance" )
        print( "@------------------" )
        
        let balance = self.helper.getCurBalance()
        print( "@ balance:", balance!, "wei" )
    }
    
    //------------------------
    // [checkEvent]確認
    //------------------------
    func checkEvent() throws{
        print( "@------------------" )
        print( "@ checkEvent" )
        print( "@------------------" )

        let contract = CheckEvent()
        var hash: String?
        
        hash = try contract.callEvVal0( self.helper, password:self.password )
        print( "@ callEventVal0:", hash! )

        hash = try contract.callEvVal1( self.helper, password:self.password )
        print( "@ callEventVal1:", hash! )

        hash = try contract.callEvVal2( self.helper, password:self.password )
        print( "@ callEventVal2:", hash! )

        hash = try contract.callEvVal3( self.helper, password:self.password )
        print( "@ callEventVal3:", hash! )
        
        hash = try contract.callEvVal4( self.helper, password:self.password )
        print( "@ callEventVal4:", hash! )
        
        hash = try contract.callEvVal13( self.helper, password:self.password )
        print( "@ callEventVal13:", hash! )

        hash = try contract.callEvUint32Val4( self.helper, password:self.password )
        print( "@ callEvUint32Val4:", hash! )

        hash = try contract.callEvPackedVal( self.helper, password:self.password )
        print( "@ callEvPackedVal:", hash! )
        
        hash = try contract.callEvIndexedArg0( self.helper, password:self.password )
        print( "@ callEvIndexedArg0:", hash! )

        hash = try contract.callEvIndexedArg1( self.helper, password:self.password )
        print( "@ callEvIndexedArg1:", hash! )

        hash = try contract.callEvIndexedArg2( self.helper, password:self.password )
        print( "@ callEvIndexedArg2:", hash! )

        hash = try contract.callEvIndexedArg3( self.helper, password:self.password )
        print( "@ callEvIndexedArg3:", hash! )

        hash = try contract.callEvJumpingIndexedArg( self.helper, password:self.password )
        print( "@ callEvJumpingIndexedArg:", hash! )

        hash = try contract.callEvLongName64( self.helper, password:self.password )
        print( "@ callEvLongName64:", hash! )
    }
}
