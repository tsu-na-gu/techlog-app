class DropAdminUserAndUsersCascade < ActiveRecord::Migration[7.1]
  def up
    execute "DROP TABLE IF EXISTS admin_users CASCADE;"
    execute "DROP TABLE IF EXISTS users CASCADE;"
  end
  def down
    # do nothing
  end
end
