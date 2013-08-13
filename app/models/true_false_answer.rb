class TrueFalseAnswer < ActiveRecord::Base
  attr_accessible :content, :true_false_question_id
  
  belongs_to :true_false_question
end
