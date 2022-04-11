class User < ApplicationRecord
  
  before_save { self.email = email.downcase}
  has_many :events, dependent: :destroy
  validates :username, presence: true, 
                      uniqueness: { case_sensetive: false},
                      length: { minimum: 3, maximum: 25 }

  
  validates :email, presence: true, 
                      uniqueness: { case_sensetive: false},
                      length: { maximum: 105 }

  has_secure_password                    
                      
end
