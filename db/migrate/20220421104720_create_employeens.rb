class CreateEmployeens < ActiveRecord::Migration[5.2]
  def change
    create_table :employeens do |t|
      t.string :employee_name
      t.string :email
      t.string :password
      t.string :gender
      t.string :hobbies
      t.string :address
      t.string :mobile_number
      t.date :birth_date
      t.string :document

      t.timestamps
    end
  end
end
