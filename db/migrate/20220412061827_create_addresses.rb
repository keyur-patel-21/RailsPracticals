class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :user_address
      t.belongs_to :user, foreign_key: true
    end
  end
end
