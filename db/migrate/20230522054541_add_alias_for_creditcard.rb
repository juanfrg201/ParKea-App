class AddAliasForCreditcard < ActiveRecord::Migration[7.0]
  def change
    add_column :creditcards, :alias, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
