class AddUseridToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :user_id, :int
  end
end
