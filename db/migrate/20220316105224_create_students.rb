class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :s_firstname
      t.string :s_lastname
      t.date :s_dob
      t.string :s_department
      t.string :s_terms

      t.timestamps
    end
  end
end
