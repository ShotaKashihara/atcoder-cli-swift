# AtCoderCLI for Swift (accs)

[AtCoder](https://atcoder.jp/?lang=ja) command line tools for Swift

<img src="misc/top.png">

- コンテスト毎に Xcode プロジェクトを作成します
- 問題ごとにサンプルテストケースを作成します

## Requirements

[online-judge-tools](https://github.com/online-judge-tools/oj) ([インストール手順](https://github.com/online-judge-tools/oj#how-to-install))

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

この際、ターゲットを問題のアルファベットに切り替えておくと良いです (⌃(control) + ⌘（command） + ] がショートカットキーです)

5. テストが通ったら AtCoder の提出ページからコードを提出します
