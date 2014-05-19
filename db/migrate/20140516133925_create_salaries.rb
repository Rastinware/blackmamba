class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.references :personnel, index: true
      t.integer :month
      t.integer :year

      t.float :normal_work
      t.float :extra_work
      t.float :efficient_work
      t.float :off_work

      t.decimal :base_salary
      t.decimal :continuous_monthly_income
      t.decimal :aggregated_yearly_income
      t.decimal :aggregated_yearly_tax

      t.decimal :total_income
      t.decimal :total_reduction
      t.decimal :net_payment

      t.timestamps
    end
  end
end
