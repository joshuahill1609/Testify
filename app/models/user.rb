class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :grade_taught, :last_name,
                  :password, :password_confirmation, :school_name, :session_token,
                  :subject_taught, :username

  validates :username, presence: true

  has_many :tests

  has_secure_password
end
