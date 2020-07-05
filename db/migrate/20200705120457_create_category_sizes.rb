class CreateCategorySizes < ActiveRecord::Migration[5.2]
  def change
    create_table :category_sizes do |t|
      t.bigint :categories_id, foreign_key: true
      t.bigint :sizes_id, foreign_key: true
      t.timestamps
    end
  end
end
