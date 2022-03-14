class ChangeColToBooks < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :user_id, :author_id
  end
end
