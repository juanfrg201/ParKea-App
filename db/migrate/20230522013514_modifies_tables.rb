class ModifiesTables < ActiveRecord::Migration[7.0]
  def up
    drop_table :roles, if_exists: true
    drop_table :role, if_exists: true
    drop_table :user_roles, if_exists: true
    drop_table :user_role, if_exists: true
    remove_column :users, :roles_id, if_exists: true
    remove_column :users, :user_role_id, if_exists: true
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

