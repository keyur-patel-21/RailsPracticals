class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.bigint  :imageable_id
      t.string  :imageable_type
    end
    add_index :images, [:imageable_type, :imageable_id]
  end
end
