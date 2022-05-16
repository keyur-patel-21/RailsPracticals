class CreateJusers < ActiveRecord::Migration[5.2]
  def change
    create_table :jusers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.boolean :subscription
      t.string :subscription_email

      t.timestamps
    end
  end
end
