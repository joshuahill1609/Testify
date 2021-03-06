class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :email, :first_name, :grade_taught, :last_name,
                  :password, :password_confirmation, :school_name, :session_token,
                  :subject_taught, :username

  validates :username, presence: true

  has_many :tests

end
