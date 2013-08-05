class Exam < ActiveRecord::Base
  attr_accessible :exam_name, :exam_subject, :user_id, :questions_attributes, :tags_attributes

  validates :exam_name, :user_id, presence: true

  belongs_to :user

  has_many :questions, dependent: :destroy
  has_many :tags

  accepts_nested_attributes_for :questions
  accepts_nested_attributes_for :tags
end
