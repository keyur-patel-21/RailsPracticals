class User < ApplicationRecord

  
  before_save { self.email = email.downcase}

  has_many :enrollments
  has_many :events, dependent: :destroy
  has_one :address
  accepts_nested_attributes_for :address, allow_destroy: true

  validates :username, presence: true, 
                      uniqueness: { case_sensetive: false},
                      length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                      uniqueness: { case_sensetive: false},
                      length: { maximum: 105 },
                      format: { with: VALID_EMAIL_REGEX}

  has_secure_password                    
                      
end
