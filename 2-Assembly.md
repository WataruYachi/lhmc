# アセンブリ言語

## 低レイヤーにつま先を突っ込む

### こんにちは、世界！

ではまずアセンブリ言語でおなじみのプログラムを書いてみよう。

```asm:hello.asm
global _start

section .data
message: db 'hello, world', 10

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
samples/section1/hello.asm

このコードは次のようにコンパイルする。

```text
$ nasm -felf64 hello.asm -o hello.o
$ ld -o hello hello.o
$ chmod u+x hello
```

それぞれの意味については後々説明しよう。