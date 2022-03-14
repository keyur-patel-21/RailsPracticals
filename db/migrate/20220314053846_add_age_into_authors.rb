class AddAgeIntoAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :age, :float
  end
end
