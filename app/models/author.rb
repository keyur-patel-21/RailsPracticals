class Author < ApplicationRecord
  has_many :books , dependent: :destroy 
  validates :first_name, :last_name, :dob, :email, presence: true
  has_many :images , as: :imageable,  dependent: :destroy
end
