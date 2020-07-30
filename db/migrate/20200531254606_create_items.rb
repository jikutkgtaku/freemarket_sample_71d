class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name                 , null: false, index: true
      t.text        :introduction
      t.integer     :price                , null: false, index: true
      t.integer     :category_id             , null: false
      t.integer     :brand_id                
      t.references  :seller               , null: false, foreign_key: { to_table: :users }
      t.integer     :condition_id            , null: false
      t.integer     :size_id                 , null: false, default: 99
      t.integer     :shipping_fee_id         , null: false
      t.integer     :prefecture_id           , null: false
      t.integer     :shipping_period_id      , null: false
      t.integer     :shipping_way_id         , null: false
      t.integer     :status_id               , null: false, default: 1
      t.references  :buyer                , foreign_key: { to_table: :users }
      t.datetime    :closed_at
      t.timestamps
    end
    add_index :items, [:name, :price]
    add_foreign_key :items, :categories
    add_foreign_key :items, :brands
  end
end
