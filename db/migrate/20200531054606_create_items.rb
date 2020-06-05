class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name                 , null: false, index: true
      t.text        :introduction
      t.integer     :price                , null: false, index: true
      t.references  :category             , null: false, foreign_key: true
      t.references  :brand                , foreign_key: true
      t.references  :seller               , null: false, foreign_key: true
      t.references  :condition            , null: false, foreign_key: true
      t.references  :size                 , null: false, foreign_key: true
      t.references  :shipping_fee         , null: false, foreign_key: true
      t.references  :prefecture           , null: false, foreign_key: true
      t.references  :shipping_period      , null: false, foreign_key: true
      t.references  :shipping_way         , null: false, foreign_key: true
      t.references  :status               , null: false, foreign_key: true
      t.references  :buyer                , foreign_key: true
      t.datetime    :closed_at
      t.timestamps
    end
    add_index :items, [:name, :price]
  end
end
