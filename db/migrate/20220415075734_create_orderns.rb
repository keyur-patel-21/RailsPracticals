class CreateOrderns < ActiveRecord::Migration[5.2]
  def change
    create_table :orderns do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
