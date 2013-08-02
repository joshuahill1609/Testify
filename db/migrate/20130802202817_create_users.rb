class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :session_token
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :school_name
      t.string :subject_taught
      t.integer :grade_taught

      t.timestamps
    end
  end
end
