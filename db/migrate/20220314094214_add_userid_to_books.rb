class AddUseridToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :author
  end
end
