class AddOnlineArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :online, :boolean, default: false
  end
end
