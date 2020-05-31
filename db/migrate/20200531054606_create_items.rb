class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name                 , null: false, index: true
      t.text        :introduction
      t.integer     :price                , null: false, index: true
      t.references  :category_id          , null: false, foreign_key: true
      t.references  :brand_id             , foreign_key: true
      t.references  :seller_id            , null: false, foreign_key: true
      t.references  :condition_id         , null: false, foreign_key: true
      t.references  :size_id              , null: false, foreign_key: true
      t.references  :shipping_fee_id      , null: false, foreign_key: true
      t.references  :prefecture_id        , null: false, foreign_key: true
      t.references  :shipping_period_id   , null: false, foreign_key: true
      t.references  :shipping_way_id      , null: false, foreign_key: true
      t.references  :status_id            , null: false, foreign_key: true
      t.references  :buyer_id             , foreign_key: true
      t.datatime    :closed_at
      t.timestamps
    end
    add_index :items, [:name, :price]
  end
end
