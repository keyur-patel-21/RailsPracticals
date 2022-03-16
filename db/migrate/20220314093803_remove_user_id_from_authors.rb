class RemoveUserIdFromAuthors < ActiveRecord::Migration[5.2]
  def change
    remove_column :authors, :user_id, :int
  end
end
