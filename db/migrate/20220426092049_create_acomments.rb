class CreateAcomments < ActiveRecord::Migration[5.2]
  def change
    create_table :acomments do |t|
      t.string :comment
      t.date :date_of_comment
    
      t.timestamps
    end
  end
end
