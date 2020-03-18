## はじめに  
**iOS** で **Ethereum** ブロックチェーンへアクセスし、色々な形式のイベント登録を試してみるサンプルです。

イーサリアムのライトクライアントとして [**matter-labs/web3swift**](https://github.com/matter-labs/web3swift) を利用させていただいております。  

----
## 手順  
### ・**CocoaPods** の準備
　ターミナルを開き下記のコマンドを実行します  
　`$ sudo gem install cocoapods`  

### ・**web3swift** のインストール
　ターミナル上で **CheckEventGas** フォルダ(※ **Podfile** のある階層)へ移動し、下記のコマンドを実行します  
　`$ pod install`  
　
### ・ワークスペースのビルド
　**CheckEventGas.xcworkspace** を **Xcode** で開いてビルドします  
　（※間違えて **CheckEventGas.xcodeproj** のほうを開いてビルドするとエラーになるのでご注意ください）
　
### ・動作確認
　**Xcode** から **iOS** 端末にてアプリを起動し、画面をタップするとテストが実行されます  
　**Xcode** のデバッグログに下記のようなログが表示されるのでソースコードと照らし合わせてご確認下さい  
　また、実際の消費ガスに関しては、ログ中のハッシュを[イーサスキャン](https://rinkeby.etherscan.io)に入力してご確認ください

----
　
> @--------------------------  
> @ CheckEventGas: start...  
> @--------------------------  
> @------------------  
> @ setTarget  
> @------------------  
> @ target: rinkeby  
> @------------------  
> @ setKeystore  
> @------------------  
> @ loadKeystoreJson: json= {"version":3,"id":"e504683c-06e6-4979-a82a-bc2c2e30d384","crypto":{"ciphertext":"f91128c599f3ebd620ade0bc419ef10bbc968c06c33bf7246317cb53ddbc172a","cipherparams":{"iv":"f9e4c05c41dc0596c1f3fa2e8d4fa7e7"},"kdf":"scrypt","kdfparams":{"r":6,"p":1,"n":4096,"dklen":32,"salt":"d58528b1f004f733a0e4fbe1d7851b079f864a6dfe20ef51aab1465cb78d5231"},"mac":"343b5c320cc2c68aaa7ff4020c6625bc2a9b1c41eeb0f514923967a2256ad76a","cipher":"aes-128-ctr"},"address":"0x988c5515313cf829e6a70637dbcff739cbfa90f3"}  
> @ loadKeystore: result= true  
> @ CURRENT KEYSTORE  
> @ ethereumAddress: 0x988C5515313cf829e6A70637DbCff739CbfA90f3  
> @ Web3Helper is READY  
> @------------------  
> @ checkBalance  
> @------------------  
> @ balance: 99668267000000000 wei  
> @------------------  
> @ checkEvent  
> @------------------  
> @ callEventVal0: 0x16196e676f22283c2e3944a7a26dd586da26d4554c7ff06b9524e20acc4fd909  
> @ callEventVal1: 0x5dd3b17ff5f806421729c01550b3567cb6ce6565f46de12223b58236c8b35482  
> @ callEventVal2: 0xf6c153d3817a9048cead87ed7c52c6f5e60ab6387c7f1eee6a285b0569c21da2  
> @ callEventVal3: 0x3f66ed1fcd5c94864a0f3a73b43e5414c272c03eaa2217ad501e8fb36c0602e3  
> @ callEventVal4: 0xff4f65f874ea65ba3c860f37e00f1dc9bf799495000e06b7bfbe77a2e89295d0  
> @ callEventVal13: 0x77c1b805109f2220a970bdd60746e4c53842e7dc7b63ba4c12db38ddb1929546  
> @ callEvUint32Val4: 0x28d4f5ee08146e36358bf50edee270c29a5c28c694639a89698bca119b22ee99  
> @ callEvPackedVal: 0x12ab5743178a0490fb365af737c68f37f7879d0dcbbbf2dc6d78ad4d20ba310d  
> @ callEvIndexedArg0: 0xd8b76d39e4ad74bfa38088e5d93a431c4f9861ca1e7e83079a0f782b1b6c0ffc  
> @ callEvIndexedArg1: 0x80bdcd2d53fb014207b865b8b76e7ebe2b4776c9baf2b1d16a06c71caab0c3f9  
> @ callEvIndexedArg2: 0x2f64efbd0f2f2f30ef562d947bb7b298c498e2578e1834ff2402b4fb1a991f23  
> @ callEvIndexedArg3: 0x41d0dae5f9914683e41a95415ef80e8c5a068158724745d2aeafe291e30c1c73  
> @ callEvJumpingIndexedArg: 0xbfc23246fb6ba2417685003983030925e351e690300f543ec4e21a7e0b55a52d  
> @ callEvLongName64: 0xd26838c9cdc99edb93a5371547ca7461542709ca7ca18e7e88e86f923cf7cf66  
> @--------------------------  
> @ CheckEventGas: finished  
> @--------------------------  

----

## 補足

テスト用のコードが **Test.swift**、簡易ヘルパーが **Web3Helper.swift**、 イーサリアム上のコントラクトに対応するコードが **CheckEvent.swift**となります。  

その他のソースファイルは **Xcode** の **Game** テンプレートが吐き出したコードそのまんまとなります。ただし、画面タップでテストを呼び出すためのコードが **GameScene.swift** に２行だけ追加してあります。

**sol/CheckEvent.sol** はテストアプリがアクセスするコントラクトのソースとなります。**Xcode** では利用していません。

テストが開始されると、デフォルトで **Rinkeby** テストネットへ接続します。  

初回の呼び出し時であればアカウントを作成し、その内容をアプリのドキュメント領域に **key.json** の名前で出力します。二度目以降の呼び出し時は **key.json** からアカウント情報を読み込んで利用します。  

サンプルアプリではブロックチェーンへの書き込みを行うため、テストをするアカウントに十分な残高がないとエラーとなります。**Xcode** のログに作成されたアカウントのアドレスが表示されるので、適宜、対象のアカウントに送金してテストしてください。
  
----
## メモ
　2020年3月18日の時点で、下記の環境で動作確認を行なっています。  

#### 実装環境
　・macOS Mojave 10.14.4  
　・Xcode 11.3.1(11C504)

#### 確認端末
　・iPad**(第六世代) iOS 12.2  
