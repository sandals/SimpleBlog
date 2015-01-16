class RemoveDefaultNameFromComments < ActiveRecord::Migration
  def change
		change_column_default :comments, :author, nil
  end
end
