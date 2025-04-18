# Categoriesテーブルの初期データ
Category.find_or_create_by([{name: "キッチン"}, {name: "リビング/子ども"}, {name: "お風呂/トイレ"}])

# Shopsテーブルの初期データ
Shop.find_or_create_by([{name: "スーパー"}, {name: "ドラッグストア"}, {name: "オンラインショップ"}])

# Itemsテーブルの初期データ
require "csv"

CSV.foreach('db/items.csv', headers: true) do |row|
  Item.find_or_create_by(
    item_name: row['item_name'],
    checked:   row['checked'],
    user_id: row['user_id'],
    category_id: row['category_id'],
    shop_id: row['shop_id']
  )
end