class Faculty < ApplicationRecord
  validates :f_firstname, :f_lastname, :f_phone, :f_email, :f_dob, :f_designation, presence: true
  validates :f_phone, length: { is: 10 }, numericality: { only_integer: true } 
  validates :f_email, uniqueness: true
  validates :f_designation, exclusion: { in: %w(HOD Sr.Prof),
    message: "Faculty can not be %{value}" }, inclusion: { in: %w(Ass.Prof. Prof.), message: "Invalid faculty designation" }
  validate :birthdate_cannot_be_in_future

  def birthdate_cannot_be_in_future
    if f_dob.present? && f_dob >= Date.today
      errors.add(:f_dob, "can't be in the past")
    end
  end  
end
