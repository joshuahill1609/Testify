class GradeLevel < ActiveRecord::Base
  attr_accessible :grade_level

  validates :grade_level, presence: true

  has_many :examgradelevels
end
