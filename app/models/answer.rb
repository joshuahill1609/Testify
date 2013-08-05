class Answer < ActiveRecord::Base
  attr_accessible :body, :correct, :question_id

  validates :body, presence: true

  belongs_to :question
end
