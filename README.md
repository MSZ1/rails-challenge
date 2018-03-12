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

## Reflection point
普段は数値計算言語のMATLABやpythonで機械学習関連のプログラムを書いています。/n
そのためrubyやjavascriptに触れる機会が少なかったため春休みを利用して集中的に取り組んでみました。/n
また流行りのクラウドコンピューティングAWS cloud9の環境を利用することで多少の不自由はあるものの、railsの環境は簡単に構築できました。/n
経験が浅いため冗長なプログラムになり、かつAPI周辺に関してデータベースの正規化等含め未熟な状態になってしまいました。/n
今後学習を勧め次第、改善をいたします。
