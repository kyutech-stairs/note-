# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: "sample@gmail.com",
            password: "password",
            password_confirmation: "password",
            name: "参 布流",
            profile: "こんにちわ、私はサンプルです。")
User.create!(email: "example@gmail.com",
            password: "password",
            password_confirmation: "password",
            name: "金子",
            profile: "気まぐれクックです。")
Article.create!(title: "Hello World",
                content: "# Hi Im Java.
                          ```
                          sudo npm install hoge
                          ```",
                          user_id: 2,
                          price: Price.new)
20.times do |n|
  Article.create!(title: "サンプル記事#{2*n+1}",
                  content: "### サンプル記事",
                  user_id: 1,
                  price: Price.new(min: 100, max: 1000, rate: "high"))

  Article.create!(title: "サンプル記事#{2*n+2}",
                  content: "### サンプル記事",
                  user_id: 2,
                  price: Price.new(min: 100, max: 1000, rate: "low"))
end
title = 
"
「vue.js+go+firebase」で始める！
Frontend & BackendAPI両方で認証するセキュアなSPA開発ハンズオン！
"

content = 
"
こんにちは。僕です。最近は Vue.js で SPA、Go言語で APIサーバーを実装しています。ここで意識するのはフロントエンドとバックエンドの分離です。分離させたい理由は二つ。

* アプリ化の際や、今後、他のサービスと連携させるためにも、バックエンドはAPIサーバーに徹したい。
* Vue.jsで開発中にオートリロードしたい(Vue.jsをビルドして出来たファイルをGo言語でserveする形にすると、毎回ビルドするのが面倒)

しかし、これをやろうとすると認証どうするの問題が付いてきます。APIサーバ、フロントの両方をセキュアにしようとするとそれだけで時間取られます。そこで使うのが認証基盤である Firebase Authentication です。これを使うと爆速で認証が作れます。そう、爆速です。Vue.js + Firebase の 解説記事はめちゃくちゃありますが、そこで返ってくるJWT を使ったAPIサーバーでの認証はあまり記事になかったので、今回はそこも含めたセキュアなWEBアプリケーションの実装をハンズオン形式で紹介します。タイトル通り、フロントエンドは Vue.js、バックエンドは Go言語、認証基盤として Firebase を使います。

御託はいいからコード見せろという方はこちらへどうぞ
https://github.com/po3rin/vue-golang-fireauth

## 今回使う技術の概要

### vue.js
Vue.jsは現在、非常に人気のあるJavaScriptフレームワークです。GitHubでのstarはjQuery、Reactを抑え、現在最も注目されているJSフレームワークです。導入のし易さや、軽量感、学習コストが少ないことを売りにしている。

Vue.jsの入門記事を前に作ったので、初めて触る人はこちらも参考にしてみてください。
[VueCLIからVue.js入門①【VueCLIで出てくるファイルを概要図で理解】](https://qiita.com/po3rin/items/3968f825f3c86f9c4e21)
"
Article.create(title: title,
              content: content,
              user_id: 1,
              price: Price.new(min: 100, max: 200))
