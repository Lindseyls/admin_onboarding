class AddNotNullConstraintsToEmployees < ActiveRecord::Migration[8.0]
  def change
    change_column_null :employees, :name, false
    change_column_null :employees, :email, false
    change_column_null :employees, :hire_date, false
    change_column_null :employees, :onboarding_status, false
  end
end
