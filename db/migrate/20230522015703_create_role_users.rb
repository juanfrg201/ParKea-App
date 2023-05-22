class CreateRoleUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :role_users do |t|
      t.string :name

      t.timestamps
    end
  end
end
