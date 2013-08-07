class CorrectAnswer < ActiveRecord::Base
  attr_accessible :body, :question_id

  validates :body, presence: true

  belongs_to :question
end
