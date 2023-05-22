class CreateCompanyCreditCards < ActiveRecord::Migration[7.0]
  def change
    create_table :company_credit_cards do |t|
      t.string :name

      t.timestamps
    end
  end
end
