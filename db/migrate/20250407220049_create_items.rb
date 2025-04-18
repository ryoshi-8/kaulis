class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.boolean :checked, null: false
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
      t.timestamps
    end
  end
end