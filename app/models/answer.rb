class Answer < ActiveRecord::Base
  attr_accessible :body, :correct, :question_id

  validates :body, :correct, :question_id, presence: true

  belongs_to :question
end
