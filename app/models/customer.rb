class Customer < ApplicationRecord
  validates :email, uniqueness: true
  validates :firstname, :lastname, :email, :phone, presence: true
  validates :phone, length: {minimum:10, maximum:11}
  has_many  :orders, dependent: :destroy
end
