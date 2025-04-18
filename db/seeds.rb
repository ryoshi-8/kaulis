# 仮のUsersテーブルの初期データ
User.create(username: "test", email: "test@test.com", password: "1234abcd")

# Categoriesテーブルの初期データ
Category.create([{name: "キッチン"}, {name: "リビング/子ども"}, {name: "お風呂/トイレ"}])

# Shopsテーブルの初期データ
Shop.create([{name: "スーパー"}, {name: "ドラッグストア"}, {name: "オンラインショップ"}])

# Itemsテーブルの初期データ
require "csv"

CSV.foreach('db/items.csv', headers: true) do |row|
  Item.create(
    item_name: row['item_name'],
    checked:   row['checked'],
    user_id: row['user_id'],
    category_id: row['category_id'],
    shop_id: row['shop_id']
  )
end