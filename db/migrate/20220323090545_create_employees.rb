class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :age
      t.integer :no_of_order
      t.boolean :full_time_available
      t.integer :salary

      t.timestamps
    end
  end
end
