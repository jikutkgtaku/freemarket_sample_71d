class ChangeIntroductionToItems < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :introduction, false
  end
end
