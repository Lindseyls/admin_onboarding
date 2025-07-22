class Department < ApplicationRecord
  has_many :employees

  def head
    employees.joins(:role).where("roles.permission_level >= ?", 5).first
  end
end
