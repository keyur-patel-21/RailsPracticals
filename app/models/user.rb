class User < ApplicationRecord
  has_many :events
  validates :username, presence: true, 
                      uniqueness: { case_sensetive: false},
                      length: { minimum: 3, maximum: 25 }

 
  validates :email, presence: true, 
                      uniqueness: { case_sensetive: false},
                      length: { maximum: 105 }

  has_secure_password                    
                      
end
