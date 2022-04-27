class CreateMyorders < ActiveRecord::Migration[5.2]
  def change
    create_table :myorders do |t|
      t.string :quanity
      t.integer :myproduct_id

      t.timestamps
    end
  end
end
