class Order < ApplicationRecord

  belongs_to :customer 
  belongs_to :product
  
  before_save :check

  def change
    puts "----------------------------------------------------------"
    puts self.product_id
  end
end
