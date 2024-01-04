class DropCategories < ActiveRecord::Migration[7.1]
  def change
    drop_table :Categories
  end
end
