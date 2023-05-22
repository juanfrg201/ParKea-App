class DropColummnsToUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :user_role, if_exists: true
    remove_column :users, :user_role, if_exists: true
  end
end
