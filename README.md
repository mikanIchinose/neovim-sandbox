# neovim-sandbox

## 開発方針

極力luaで書く
Neovim本来の機能をフル活用する
プラグイン地獄にしない
プラグイン間で依存がある場合、よきせぬエラーが起こらないようにする
プラグイン由来のキーマップは全てわかるようにする
保守性の高いコードを書く
拡張性の高いコードを書く
設定が書きやすいこと
テスタブルであること
CI/CDでの品質保証
理想は[LunarVim](https://github.com/ChristianChiarulli/LunarVim)と[SpaceVim](https://github.com/SpaceVim/SpaceVim)

## 機能

FuzzyFinderでのファイル・バッファ移動
目に優しい
使用頻度の低いコマンドは覚えなくても良くする
プラグインの遅延読み込み
LSPによる強い補完
自動フォーマット
静的解析ツールの活用

(マークダウンエディタに特化した作り)

## SpaceVim
### What is it?
### Key feature
#### mnemonic
which-keyを駆使することでキーバンドを覚えなくて済むようになっている
#### layer
プラグインの設定というよりもgitやjavascriptなど特定のコンテキストで設定が構築されているので、gitに最適なプラグインと設定がレイヤーを導入するだけで実現できる
