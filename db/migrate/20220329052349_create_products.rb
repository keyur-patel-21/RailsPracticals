class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :capacity
      t.string :is_active
      t.string :status

      t.timestamps
    end
  end
end
