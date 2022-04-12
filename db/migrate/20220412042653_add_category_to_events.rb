class AddCategoryToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :category
  end
end
