class Employee < ApplicationRecord
  validates :firstname, :lastname, :email, :age, :no_of_order, :full_time_available, :salary ,presence: true
  validates :age, :no_of_order, :salary, numericality: {only_integer: true}
  validates :email, confirmation:true , format: { with: URI::MailTo::EMAIL_REGEXP } , uniqueness: true
  validate :salary_cantbe_zero
  
  def salary_cantbe_zero  
    if salary == 0
      errors.add(:salary, "Salary can not be zero.")
    end
  end
end
