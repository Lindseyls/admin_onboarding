class Employee < ApplicationRecord
  belongs_to :department
  belongs_to :role

  validates :name, :email, :hire_date, :onboarding_status, presence: true

  ONBOARDING_STATUSES = ["Not Started", "In Progress", "Completed"]

  validate :valid_status_transition, on: :update

  private

  def valid_status_transition
    return if onboarding_status_was.nil? # new record

    allowed = {
      "Not Started" => ["In Progress"],
      "In Progress" => ["Completed"]
    }

    if onboarding_status_changed? && !allowed[onboarding_status_was]&.include?(onboarding_status)
      errors.add(:onboarding_status, "transition not allowed from #{onboarding_status_was} to #{onboarding_status}")
    end
  end
end
