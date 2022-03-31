class Order < ApplicationRecord
  enum status: %i[Booked Cancelled] 
  belongs_to :customer 
  belongs_to :product
end
