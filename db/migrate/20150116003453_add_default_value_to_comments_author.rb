class AddDefaultValueToCommentsAuthor < ActiveRecord::Migration
  def change
		change_column_default :comments, :author, "Anonymous"
  end
end
