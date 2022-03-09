class Product < ApplicationRecord
  validates :productname, :productprice, :discount, presence: true
end
