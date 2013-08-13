class TrueFalseQuestion < ActiveRecord::Base
  attr_accessible :content, :exam_id
  
  belongs_to :exam
  has_many :true_false_answers, dependent: :destroy
  
end
