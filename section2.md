# Section2 Primitive Parser

## 構文解析

まず簡単な電卓の作成から始めよう。
つまり、次のような文字列が与えられたとき

```text
"1+1"
```

式の演算結果

```text
2
```

を返すようなプログラムを作るということだ。

### パーサ

ではどのようにして文字列を処理し、計算の結果を求めるべきだろうか。
こういった場合、関数型プログラミングでは関数を使って解決するのがお決まりだ。

というわけで、問題を簡単にするためにある関数を考えることにしよう。

```haskell
parser :: a -> b
parser = undefined
```

関数とはある`型'a'の引数`を受け取ってある`型'b'の値を返す`もののことだ。

Haskellではこれを型注釈::で明示する事ができる。

では電卓を一つの関数と考えよう。
そうなると、電卓の受け取る値とはこの場合文字列にほかならない。
Haskellでは文字列を表す型としてStringという型があるので、
関数parserの型は次のように表せる。
(?はまだ型が決まっていないということで、Haskellにおいて正しい構文ではない)

```haskell
parser :: String -> ?
```

BNFによる式の構文を次に示す。

```text
<expr>  ::= <term> | <expr> '+' <expr> | <expr> '-' <expr>
<term>   ::= <factor> | <term> '*' <term> | <term> '/' <term>
<factor> ::= <int> | '(' <expr> ')'
<int>    ::= ... | -1 | 0 | 1 | ... 
```

これに対応する代数型データ構造(ATD)は

```haskell
data Expr = Term | ADD Expr Expr | SUB Expr Expr
data Term  = Factor | MUL Term Term | DIV Term Term
data Factor = Int | Expr
```

