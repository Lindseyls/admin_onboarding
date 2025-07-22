class Role < ApplicationRecord
  has_many :employees

  validates :title, :permission_level, presence: true
end
