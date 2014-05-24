class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|

      # References
      t.references :personnel, index: true
      t.integer :month
      t.integer :year

      # Work
      t.float :normal_work
      t.float :extra_work
      t.float :efficient_work
      t.float :off_work

      # Incomes
      t.decimal :incomes_base_salary
      t.decimal :incomes_extra_work
      t.decimal :incomes_housing
      t.decimal :incomes_worker_subsidizes
      t.decimal :incomes_productivity_bonuses

      # Reductions
      t.decimal :reductions_insurance
      t.decimal :reductions_tax
      t.decimal :reductions_current_month

      # Totals
      t.decimal :base_salary
      t.decimal :continuous_monthly_income
      t.decimal :aggregated_yearly_income
      t.decimal :aggregated_yearly_tax

      t.decimal :total_income
      t.decimal :total_reduction
      t.decimal :net_payment

      t.boolean :salaries, :is_read, :boolean, :null => false, :default => false

      t.timestamps
    end
  end
end
