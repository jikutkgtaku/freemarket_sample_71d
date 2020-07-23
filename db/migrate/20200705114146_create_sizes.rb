class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes, id: :integer do |t|
      t.string :name
      t.string :ancestry
      t.timestamps
    end
  end
end
