class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.integer :total_price
      t.integer :product_id
      t.string :status
      t.integer :customer_id

      t.timestamps
    end
  end
end
