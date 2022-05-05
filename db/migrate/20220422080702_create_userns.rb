class CreateUserns < ActiveRecord::Migration[5.2]
  def change
    create_table :userns do |t|
      t.string :name
      t.string :email
      t.string :picture

      t.timestamps
    end
  end
end
