class TrueFalseQuestion < ActiveRecord::Base
  attr_accessible :content, :exam_id, :position, :true_false_answers_attributes
  
  belongs_to :exam
  acts_as_list scope: :exam
  
  has_many :true_false_answers, dependent: :destroy
  
  accepts_nested_attributes_for :true_false_answers
end
