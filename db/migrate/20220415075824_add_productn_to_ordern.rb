class AddProductnToOrdern < ActiveRecord::Migration[5.2]
  def change
    add_column :orderns, :productn_id, :integer
  end
end
