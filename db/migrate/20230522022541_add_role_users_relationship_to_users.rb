class AddRoleUsersRelationshipToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :role, null: true, foreign_key: true, :default => nil
  end
end
