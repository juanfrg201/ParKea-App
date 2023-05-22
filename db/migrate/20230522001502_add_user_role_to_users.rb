class AddUserRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :roles, null: true, foreign_key: true
  end
end
