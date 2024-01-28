class Drop < ActiveRecord::Migration[7.1]
  def change
    drop_table :active_admin_comments
  end
end
