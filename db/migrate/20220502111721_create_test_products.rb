class CreateTestProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :test_products do |t|
      t.string :product_name
      t.integer :price
      t.string :description
      t.integer :myuser_id

      t.timestamps
    end
  end
end
