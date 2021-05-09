# Getting Started

## コンテストの始め方

### 1. コンテスト名から Xcode プロジェクトの作成

```bash
# コンテスト名はコンテストページURLの末尾の文字列を参照します
# ex. http://atcoder.jp/contests/abc190 -> abc190
accs new abc190
```

### 2. 作成したプロジェクトを開く

```
cd abc190
open Package.swift
```

### 3. `Sources/A/main.swift` を開いて問題を解きます

<img src="misc/open_first_task.png">

### 4. 問題が解けたら <kbd>⌘（command）</kbd>-<kbd>U</kbd> でテストを実行します

<img src="misc/test_done.png">


*ビルドターゲットを問題のアルファベットに切り替えておくと良いです

<img src="misc/select_target.png">

- ショートカットキー: <kbd>⌃(control)</kbd>-<kbd>⌘（command）</kbd>-<kbd>]</kbd>

### 5. テストが通ったらコードを提出します

```bash
# 提出コードがA問題なら <task> には `a` を指定します
accs submit <task> -r
```

<img src="misc/submit_page.png">
