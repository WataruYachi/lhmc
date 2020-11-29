# アセンブリ言語

## 低レイヤーにつま先を突っ込む

### こんにちは世界

ではまずアセンブリ言語でおなじみのプログラムを書いてみよう。

```asm:hello.asm
; samples/section1/hello.asm

global _start

section .data
message: db 'hello, world', 10 ; "hello, world\n"

section .text
_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, 14
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
```

このコードは次のようにコンパイルする。

```text
$ nasm -felf64 hello.asm -o hello.o
$ ld -o hello hello.o
$ chmod u+x hello
```

ではプログラムを実行してみよう。

```text
$ ./hello
$ hello, world