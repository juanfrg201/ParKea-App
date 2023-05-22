class DropTablesToUserRelations < ActiveRecord::Migration[7.0]
  def change
    drop_table :user_roles, if_exists: true
    drop_table :roles, if_exists: true
    drop_table :role_users, if_exists: true
  end
end
