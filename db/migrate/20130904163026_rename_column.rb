class RenameColumn < ActiveRecord::Migration
  def up
    rename_column :users, :email, :email_address
  end

  def down
  end
end
