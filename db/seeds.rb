# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

hr = Department.create!(name: "HR")
it = Department.create!(name: "IT")

manager = Role.create!(title: "Manager", permission_level: 5)
assistant = Role.create!(title: "Assistant", permission_level: 2)
data_engineer = Role.create!(title: "Data Engineer", permission_level:3)

Employee.create!(
  name: "Jane Doe",
  email: "jane@uni.edu",
  hire_date: Date.today,
  onboarding_status: "Not Started",
  department: hr,
  role: manager
)

Employee.create!(
  name: "Coco Music",
  email: "coco@uni.edu",
  hire_date: Date.today,
  onboarding_status: "Not Started",
  department: it,
  role: data_engineer
)