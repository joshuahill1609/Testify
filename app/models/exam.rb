class Exam < ActiveRecord::Base
  attr_accessible :exam_name, :exam_subject, :user_id, :questions_attributes, :tag_ids, :grade_level_ids

  validates :exam_name, :user_id, presence: true

  belongs_to :user

  has_many :questions, dependent: :destroy
  has_many :examtags
  has_many :tags, through: :examtags

  has_many :exam_grade_levels
  has_many :grade_levels, through: :exam_grade_levels

  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true

end
