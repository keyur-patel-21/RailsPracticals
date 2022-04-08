class ChangeStatusInOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :status, :integer
  end
end
