class AddRoleUserToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :role_user, foreign_key: true
  end
end
