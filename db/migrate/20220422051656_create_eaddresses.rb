class CreateEaddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :eaddresses do |t|
      t.string :house_name
      t.string :street_name
      t.string :road
      t.integer :employeen_id

      t.timestamps
    end
  end
end
