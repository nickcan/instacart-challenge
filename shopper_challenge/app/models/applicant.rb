class Applicant < ApplicationRecord
  validates :first_name, :last_name, :email, :phone, :zip_code, presence: true
  validates :email, :phone, uniqueness: true

  POSSIBLE_WORKFLOW_STATES = [
    :applied,
    :quiz_started,
    :quiz_completed,
    :onboarding_requested,
    :onboarding_completed,
    :hired
  ].freeze
end
