class CreateMyproducts < ActiveRecord::Migration[5.2]
  def change
    create_table :myproducts do |t|
      t.string :name
      t.integer :rate

      t.timestamps
    end
  end
end
