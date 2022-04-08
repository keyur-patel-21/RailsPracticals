class ChangeStatusInProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :status, :integer
  end
end
