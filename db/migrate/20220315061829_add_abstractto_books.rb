class AddAbstracttoBooks < ActiveRecord::Migration[5.2]
  def change
    def up
      # add_column :books, :abstract, :text
    end
    def down
      remove_column :books, :abstract
    end
  end
end
