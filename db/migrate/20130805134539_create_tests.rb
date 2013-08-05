class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :test_name
      t.string :subject
      t.integer :user_id

      t.timestamps
    end
  end
end
