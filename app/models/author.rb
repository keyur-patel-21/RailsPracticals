class Author < ApplicationRecord
  has_many :books  
  validates :first_name, :last_name, :dob, :email, presence: true
  has_many :images
  end