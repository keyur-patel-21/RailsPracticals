class AddAuthorBookRefToImages < ActiveRecord::Migration[5.2]
  def change
    add_reference :images, :author, foreign_key: true
    add_reference :images, :book, foreign_key: true
  end
end
