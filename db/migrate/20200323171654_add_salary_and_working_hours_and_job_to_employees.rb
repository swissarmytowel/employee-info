class AddSalaryAndWorkingHoursAndJobToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :salary, :integer
    add_column :employees, :working_hours, :integer
    add_column :employees, :job, :string
  end
end
