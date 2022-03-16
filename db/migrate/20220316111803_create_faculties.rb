class CreateFaculties < ActiveRecord::Migration[5.2]
  def change
    create_table :faculties do |t|
      t.string :f_firstname
      t.string :f_lastname
      t.integer :f_phone
      t.string :f_email
      t.date :f_dob
      t.string :f_designation

      t.timestamps
    end
  end
end
