# まずは電卓から

## 数字のコンパイル

まずは簡単なコンパイラから作成をはじめよう。
我々が作る記念すべき最初のコンパイラは、
たった一つの数字を返すだけのプログラムを生み出すだけの
ごく単純なコンパイラだ。

我々はまだ数字をディスプレイに表示する機能、
つまり標準出力を利用できるルーチンを持たない。
そのため、値を返す方法としてexitシステムコールを利用しよう。
exitシステムコールは終了コードを引数としてとり、
プログラムを終了させる。

```text
global _start

section .text 
_start:
    mov rdi, 1   ; 引数
    mov rax, 60  ; exitの番号は60
    syscall
```

コンパイルして出来たプログラムを実行しても、
シェルには何も表示されない。
しかしシェルでは最後に返された終了コードを次のように確認することができる。

```text
$ echo $?
$ 1
```
> **注意**
> 終了コードの確認はシェルごとに異なる。
> ちなみに上記の方法はBashシェルの方法である。


ではこのアセンブリを生成するHaskellプログラムを書いていこう。

```Haskell
module Main where

import System.Environment (getArgs)
import System.IO

path = "./tmp.asm"

genAsm :: String -> [String]
genAsm x =
    [ "global _start"
    , "section .text"
    , "_start:"
    , "mov rdi, " ++ x
    , "mov rax, 60"
    , "syscall"
    ]

main :: IO ()
main = do
    args <- getArgs
    fp <- openFile path WriteMode
    mapM_ (hPutStrLn fp) (genAsm (args !! 0))
    hClose fp
```