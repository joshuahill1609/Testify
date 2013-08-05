class ExamGradeLevel < ActiveRecord::Base
  attr_accessible :exam_id, :grade_level_id

  belongs_to :grade_level
  belongs_to :exam
end
