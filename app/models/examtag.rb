class Examtag < ActiveRecord::Base
  attr_accessible :exam_id, :tag_id

  belongs_to :exam
  belongs_to :tag
end
