class Order < ApplicationRecord
  enum status: %i[Booked Cancelled] 
  belongs_to :customer 
  belongs_to :product

  before_create :calculate_total_price
  #create method for display total price on order show page

  private
  
  def calculate_total_price
    product_price = Product.where('id = ?', product_id).pluck(:price)[0]
    self.total_price = product_price * quantity
  end
end
