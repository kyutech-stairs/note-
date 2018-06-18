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
               user_id: 1)

Article.create!(title: "今日の晩御飯",
                content: "# 豚キムチ",
                user_id: 2)
40.times do |n|
  Article.create!(title: "サンプル記事#{n}",
                  content: "### サンプル記事",
                  user_id: 1)
end
