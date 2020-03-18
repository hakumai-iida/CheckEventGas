pragma solidity >= 0.5.0 < 0.7.0;

contract CheckEvent{
  // パラメータの個数別
  event EvVal0( address indexed from );
  event EvVal1( address indexed from, uint val1 );
  event EvVal2( address indexed from, uint val1, uint val2 );
  event EvVal3( address indexed from, uint val1, uint val2, uint val3 );
  event EvVal4( address indexed from, uint val1, uint val2, uint val3, uint val4 );
  event EvVal13( address indexed from, uint  val1, uint  val2, uint  val3, uint  val4, uint  val5, uint  val6, uint  val7, uint val8, uint  val9, uint val10, uint val11, uint val12, uint val13 );

/*
  // 定義はできるけど呼び出そうとするとスタック不足でエラーとなる
  event EvVal32( address indexed from,
                 uint  val1, uint  val2, uint  val3, uint  val4, uint  val5, uint  val6, uint  val7, uint  val8,
                 uint  val9, uint val10, uint val11, uint val12, uint val13, uint val14, uint val15, uint val16,
                 uint val17, uint val18, uint val19, uint val20, uint val21, uint val22, uint val23, uint val24,
                 uint val25, uint val26, uint val27, uint val28, uint val29, uint val30, uint val31, uint val32
                );
*/                

  // [uint32]を４つ並べる vs [uint256]にパックしてみる
  event EvUint32Val4( address indexed from, uint32 val1, uint32 val2, uint32 val3, uint32 val4 );
  event EvPackedVal( address indexed from, uint256 valPacked );

  // [indexed]の個数別
  event EvIndexedArg0( address nonIndexedFrom, uint val1, uint val2 );
  event EvIndexedArg1( address indexed from, uint val1, uint val2 );
  event EvIndexedArg2( address indexed from, uint indexed indexedVal1, uint val2 );
  event EvIndexedArg3( address indexed from, uint indexed indexedVal1, uint indexed indexedVal2 );

  // とびとびの[indexed]
  event EvJumpingIndexedArg( uint val1, uint indexed indexedVal2, uint val3, uint indexed indexedVal4, address indexed from );

  // 長い名前（６４文字）
  event Ev0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz( address indexed from );

  //-------------------------------
  // EvVal0
  //-------------------------------
  function callEvVal0() public{
    emit EvVal0( msg.sender );
  }

  //-------------------------------
  // EvVal1
  //-------------------------------
  function callEvVal1( uint val1 ) public{
    emit EvVal1( msg.sender, val1 );
  }

  //-------------------------------
  // EvVal2
  //-------------------------------
  function callEvVal2( uint val1, uint val2 ) public{
    emit EvVal2( msg.sender, val1, val2 );
  }

  //-------------------------------
  // EvVal3
  //-------------------------------
  function callEvVal3( uint val1, uint val2, uint val3 ) public{
    emit EvVal3( msg.sender, val1, val2, val3 );
  }

  //-------------------------------
  // EvVal4
  //-------------------------------
  function callEvVal4( uint val1, uint val2, uint val3, uint val4 ) public{
    emit EvVal4( msg.sender, val1, val2, val3, val4 );
  }

  //-------------------------------
  // EvVal13
  //-------------------------------
  function callEvVal13( uint val ) public{
    emit EvVal13( msg.sender, val+ 1, val+ 2, val+ 3, val+ 4, val+ 5, val+ 6, val+ 7, val+ 8, val+ 9, val+10, val+11, val+12, val+13 );
  }

  //-------------------------------
  // EvUint32Val4
  //-------------------------------
  function callEvUint32Val4( uint32 val1, uint32 val2, uint32 val3, uint32 val4 ) public{
    emit EvUint32Val4( msg.sender, val1, val2, val3, val4 );
  }

  //-------------------------------
  // EvPackedVal
  //-------------------------------
  function callEvPackedVal( uint32 val1, uint32 val2, uint32 val3, uint32 val4 ) public{
    uint256 packedVal = 0;
    packedVal += uint256(val1) << 96;
    packedVal += uint256(val2) << 64;
    packedVal += uint256(val3) << 32;
    packedVal += val4;
    emit EvPackedVal( msg.sender, packedVal );
  }

  //-------------------------------
  // EvIndexedArg0
  //-------------------------------
  function callEvIndexedArg0( uint val1, uint val2 ) public{
    emit EvIndexedArg0( msg.sender, val1, val2 );
  }

  //-------------------------------
  // EvIndexedArg1
  //-------------------------------
  function callEvIndexedArg1( uint val1, uint val2 ) public{
    emit EvIndexedArg1( msg.sender, val1, val2 );
  }

  //-------------------------------
  // EvIndexedArg2
  //-------------------------------
  function callEvIndexedArg2( uint val1, uint val2 ) public{
    emit EvIndexedArg2( msg.sender, val1, val2 );
  }

  //-------------------------------
  // EvIndexedArg3
  //-------------------------------
  function callEvIndexedArg3( uint val1, uint val2 ) public{
    emit EvIndexedArg3( msg.sender, val1, val2 );
  }

  //-------------------------------
  // EvJumpingIndexedArg
  //-------------------------------
  function callEvJumpingIndexedArg( uint val1, uint val2, uint val3, uint val4 ) public{
    emit EvJumpingIndexedArg( val1, val2, val3, val4, msg.sender );
  }

  //-------------------------------
  // 長い名前（６４文字）
  //-------------------------------
  function callEvLongName64() public{
    emit Ev0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz( msg.sender );
  }
}