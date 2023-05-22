class CreateCreditcards < ActiveRecord::Migration[7.0]
  def change
    create_table :creditcards do |t|
      t.string :number_card
      t.date :exp_date

      t.timestamps
    end
  end
end
