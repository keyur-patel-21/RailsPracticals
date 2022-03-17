class Student < ApplicationRecord
  validates :s_firstname, :s_lastname, :s_department, presence: true
  validates :s_department, inclusion: { in: %w(IT CE),message: "Department can't be the %{value}" }
  validates :s_terms, acceptance: true
  validate :birthdate_cannot_be_in_future

  def birthdate_cannot_be_in_future
    if s_dob.present? && s_dob > Date.today
      errors.add(:s_dob, "can't be in the future")
    end
  end 
end
