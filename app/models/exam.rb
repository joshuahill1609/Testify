class Exam < ActiveRecord::Base
  attr_accessible :exam_name, :exam_subject, :user_id, :questions_attributes, :tag_ids

  validates :exam_name, :user_id, presence: true

  belongs_to :user

  has_many :questions, dependent: :destroy
  has_many :examtags
  has_many :tags, through: :examtags

  accepts_nested_attributes_for :questions
end
