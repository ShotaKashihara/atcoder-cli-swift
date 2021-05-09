# AtCoderCLI for Swift (accs)

[![Unit Test](https://github.com/ShotaKashihara/atcoder-cli-swift/workflows/Unit%20Test/badge.svg?event=push)](https://github.com/ShotaKashihara/atcoder-cli-swift/actions)

[Tatamo/atcoder-cli](https://github.com/Tatamo/atcoder-cli) にインスパイアされた、 Swift-er 向けの AtCoder CLI です

<img src="misc/top.png">

- コンテスト毎に Xcode プロジェクトを作成します (`accs new <contest>`)
- 問題ごとにサンプルの入出力からテストケースを作成します
- コードの提出を支援します  (`accs submit <task>`)

## Requirements

[online-judge-tools](https://github.com/online-judge-tools/oj)
コンテスト情報の取得のため、`oj-api` というコマンドに依存しています

- インストール
  - https://github.com/online-judge-tools/oj#how-to-install
- ログイン

```bash
oj login
> Username: kashihararara
> Password:
```

## Install

```bash
brew install ShotaKashihara/tap/accs
```

## Documents

[Getting Started](doc/getting_started.md)
