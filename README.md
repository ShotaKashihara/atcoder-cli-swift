# AtCoderCLI for Swift (accs)

[![Unit Test](https://github.com/ShotaKashihara/atcoder-cli-swift/workflows/Unit%20Test/badge.svg?event=push)](https://github.com/ShotaKashihara/atcoder-cli-swift/actions)

[Tatamo/atcoder-cli](https://github.com/Tatamo/atcoder-cli) にインスパイアされた Swift-er 向けの AtCoder CLI です。

コンテストに対応する Swift Package プロジェクトを作成します。


- Swift Package プロジェクトには各問題に対応する Target と TestTarget が含まれます。
- XCTest のテストケースを問題のサンプル入出力から自動で作成します。

<img src="misc/top.png">

## Install

```bash
brew install ShotaKashihara/tap/accs
```

## Usage

```bash
$ accs new abc001 # "abc001/" directory will be created
$ cd abc001/
$ open Package.swift # Launch Swift Package project with Xcode
# ... write your solution ...
$ accs submit {:problem_alphabet} # to use submit function
```

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

## Documents

[Getting Started](doc/getting_started.md)
