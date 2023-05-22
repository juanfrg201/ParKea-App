class ModifiesTables < ActiveRecord::Migration[7.0]
  def up
    drop_table :roles
    drop_table :user_roles
    remove_column :users, :roles_id
    remove_column :users, :user_role_id
  end
  def down
    puts "error"
  end
end
