class AddProductidAndCustomeridToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :product
    add_reference :orders, :customer
  end
end
