class Myproduct < ApplicationRecord

  validates :name, :rate, presence: true

  has_many :myorders
end
