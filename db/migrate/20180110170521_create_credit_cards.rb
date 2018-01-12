class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :number
      t.string :CCV
      t.string :expiration_date
      t.references :wallet, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
