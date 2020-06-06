class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items, id: :integer do |t|
      t.string      :name                 , null: false, index: true
      t.text        :introduction
      t.integer     :price                , null: false, index: true
      t.integer  :category_id             , null: false, foreign_key: true
      t.integer  :brand_id                , foreign_key: true
      t.bigint  :seller_id               , null: false, foreign_key: true
      t.integer  :condition_id            , null: false, foreign_key: true
      t.integer  :size_id                 , null: false, foreign_key: true
      t.integer  :shipping_fee_id         , null: false, foreign_key: true
      t.integer  :prefecture_id           , null: false, foreign_key: true
      t.integer  :shipping_period_id      , null: false, foreign_key: true
      t.integer  :shipping_way_id         , null: false, foreign_key: true
      t.integer  :status_id               , null: false, foreign_key: true
      t.bigint  :buyer_id                , foreign_key: true
      t.datetime    :closed_at
      t.timestamps
    end
    add_index :items, [:name, :price]
    add_foreign_key :items, :categories
    add_foreign_key :items, :brands
  end
end
