CPU設計のお勉強
====

Overview

## 目的
2*2"2て崩しのルービックキューブを解くアルゴリズムの実装を通して，CPUの仕組みを理解する
## 手段
Verilog, GTKwave
## 回路構成
<a><img src="https://github.com/YYYYusuke/CPU/blob/master/images/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202017-06-25%2013.21.10.png" width=50%></a>
## 使用する命令セット

1.ADD 加算  
2.CHECK 指定したレジスタの値の照合  
3.STORE 指定したレジスタの値をメモリに格納  
4.LI 指定したレジスタに値を代入  
5.JMP 指定したPCへのジャンプ  
6.JNZ CHECKが真ならJMP  
7.ZNJ CHECKが偽ならJMP  
8.REFERENCE 回転命令の決定に使用（後述）  
9.RTX90 x軸方向に90度回転  
10.RTX180 x軸方向に180度回転  
11.RTX270 x軸方向に270度回転  
12.RTY90 y軸方向に90度回転  
13.RTY180 y軸方向に180度回転  
14.RTY270 y軸方向に270度回転  
15.RTZ90 z軸方向に90度回転  
16.RTZ180 z軸方向に180度回転  
17.REFERENCE で次の回転命令を決定  

## 大まかな流れ  
1.RT*** によってルービックキューブを回転  
2.回転後の状態をCHECK  
3.キューブが完成していれば結果をSTORE  
4.完成していなければ次の回転へ...  

##回転の仕組み

<a><img src="https://github.com/YYYYusuke/CPU/blob/master/images/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202017-06-25%2013.44.13.png" width=50%></a>


## アルゴリズム

<a><img src="https://github.com/YYYYusuke/CPU/blob/master/images/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202017-06-25%2013.44.23.png" width=50%></a>

##探索方法
<a><img src="https://github.com/YYYYusuke/CPU/blob/master/images/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202017-06-25%2013.44.40.png" width=50%></a>

##Result
<a><img src="https://github.com/YYYYusuke/CPU/blob/master/images/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202017-06-25%2013.45.04.png" width=50%></a>

## URL


## Author


