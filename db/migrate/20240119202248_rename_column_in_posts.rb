class RenameColumnInPosts < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :content, :body
  end
end
