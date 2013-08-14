class EssayQuestion < ActiveRecord::Base
  attr_accessible :content, :exam_id
  
  belongs_to :exam
  acts_as_list scope: :exam
end
