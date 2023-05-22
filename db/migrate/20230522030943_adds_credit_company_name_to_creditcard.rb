class AddsCreditCompanyNameToCreditcard < ActiveRecord::Migration[7.0]
  def change
    add_reference :creditcards, :company_credit_card, null: false, foreign_key: true
  end
end
