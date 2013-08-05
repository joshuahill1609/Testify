class Tag < ActiveRecord::Base
  attr_accessible :exam_id, :tag_title

  validates :tag_title, presence: true

  belongs_to :exam
end
