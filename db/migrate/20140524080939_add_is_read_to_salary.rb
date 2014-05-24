class AddIsReadToSalary < ActiveRecord::Migration
  def change
    add_column :salaries, :is_read, :boolean, :null => false, :default => false
  end
end
