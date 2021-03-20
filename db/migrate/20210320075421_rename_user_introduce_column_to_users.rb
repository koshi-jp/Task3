class RenameUserIntroduceColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :user_introduce, :introduction
  end
end
