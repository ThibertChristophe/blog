class AddArticlesCountToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :articles_count, :integer, default: 0
  end
end
