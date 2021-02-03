# AtCoderCLI for Swift (accs)

[AtCoder](https://atcoder.jp/?lang=ja) command line tools for Swift
[Tatamo/atcoder-cli](https://github.com/Tatamo/atcoder-cli) を参考に、 Swift コーダー向けにカスタマイズしました

<img src="misc/top.png">

- コンテスト毎に Xcode プロジェクトを作成します
- 問題ごとにサンプルテストケースを作成します

## Requirements

[online-judge-tools](https://github.com/online-judge-tools/oj) ([インストール手順](https://github.com/online-judge-tools/oj#how-to-install))

- コードの提出を行う場合、`oj login` が必要です

```bash
oj login
> Username: kashihararara
> Password:
```

コンテスト情報の取得のため、`oj-api` というコマンドを内部で使用しています。

## Install

```bash
git clone https://github.com/ShotaKashihara/atcoder-cli-swift
cd atcoder-cli-swift
swift build -c release
cp -f .build/release/accs /usr/local/bin/.
```

## Usage

### コンテストの始め方

1. コンテスト名から Xcode プロジェクトの作成

```bash
# コンテスト名はコンテストページURLの末尾の文字列を参照します
# ex. http://atcoder.jp/contests/abc190 -> abc190
accs new abc190
```

2. 作成したプロジェクトを開く

```
open abc190/Package.swift
```

3. `Sources/A/main.swift` を開いて問題を解きます



4. 問題が解けたら ⌘（command） + U でテストを実行します

- ビルドターゲットを問題のアルファベットに切り替えておくと良いです
  - ショートカットキー: ⌃(control) + ⌘（command） + ]

5. テストが通ったらコードを提出します

```bash
cd abc190/
# A問題の提出なら submit の直後に `a` を指定します
accs submit a -r
```
