class AddLikesToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :likes, :integer
  end
end
