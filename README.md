# 概要
AWS cloud9でrails環境を構築し、vue.js + materializeで簡単なwebアプリケーションを作成しました。

## Description
AWS cloud9上からの接続は以下のgif画像を参考にしてください

## Usage
### AWS cloud9で事前に必要となるコマンド(webpackを利用しているためyarnが必要になります)
```sh
sudo wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
sudo yum install yarn
```
nodeやrails等はAWS cloud9上ではじめから用意されているものを使用しました

## Run
実行結果は以下のようになります。
![gif](https://user-images.githubusercontent.com/33398758/37268335-b73ca8b4-2608-11e8-8787-bcd1aac4d0cb.gif)


## Reflection point
普段は数値計算言語のMATLABやpythonで機械学習関連のプログラムを書いています。

そのためrubyやjavascriptに触れる機会が少なかったため春休みを利用して集中的に取り組んでみました。

また環境構築にAWS cloud9を利用しています。

経験が浅いため冗長なプログラムになり、かつAPI周辺に関してデータベースの正規化等含め未熟な状態になってしまいました。

今後学習を勧め次第、改善をいたします。
