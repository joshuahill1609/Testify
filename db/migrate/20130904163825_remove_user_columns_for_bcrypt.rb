class RemoveUserColumnsForBcrypt < ActiveRecord::Migration
  def up
  
  end

  def down
    remove_column :users, :password_digest
    remove_column :users, :session_token
  end
end
