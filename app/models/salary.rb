class Salary < ActiveRecord::Base
  require 'csv'

  belongs_to :personnel

  def self.import(delete_previous, year, month, file)

    if delete_previous 
      # Remove previous salaries of the selected month
      Salary.destroy_all(:year => year, :month => month)
    end

    imported_items = 0;
    personnel_code_not_found = 0;

    # Import new salaries
    CSV.foreach(file.path, headers: true, col_sep: ';') do |row|
      new_salary = row.to_hash
      
      # Get personnel id by its code
      personnel_code = new_salary['personnel_code'].to_s
      new_salary.delete('personnel_code')
      personnels = Personnel.where(:code => personnel_code)
      if personnels.size == 1
        new_salary['personnel_id'] = personnels.first.id
        new_salary['year'] = year
        new_salary['month'] = month
        
        Salary.create!(new_salary)

        imported_items += 1
      else
        personnel_code_not_found += 1
      end
    end

    [imported_items, personnel_code_not_found]
  end
end
