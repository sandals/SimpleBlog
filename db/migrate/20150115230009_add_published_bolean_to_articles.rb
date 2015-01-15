class AddPublishedBoleanToArticles < ActiveRecord::Migration
  def change
		add_column :articles, :published, :boolean, null: false, default: false
  end
end
