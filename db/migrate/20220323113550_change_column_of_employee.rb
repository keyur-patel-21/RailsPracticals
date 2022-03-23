class ChangeColumnOfEmployee < ActiveRecord::Migration[5.2]
  def change
    change_column :employees, :full_time_available, :string
  end
end
