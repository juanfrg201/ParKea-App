class CreateFidelities < ActiveRecord::Migration[7.0]
  def change
    create_table :fidelities do |t|
      t.boolean :active
      t.references :user, null: false, foreign_key: true
      t.references :parking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
