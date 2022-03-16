class AddAuthorIdToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :user_id, :int
  end
end
