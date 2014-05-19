class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.references :personnel, index: true
      t.integer :month
      t.integer :year

      t.string :name
      t.decimal :installment
      t.decimal :remain

      t.timestamps
    end
  end
end
