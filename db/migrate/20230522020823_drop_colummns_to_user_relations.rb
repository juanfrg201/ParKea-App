class DropColummnsToUserRelations < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :user_role_id, if_exists: true
    remove_column :users, :roles_id, if_exists: true
    remove_column :users, :role_user_id, if_exists: true
  end
end
