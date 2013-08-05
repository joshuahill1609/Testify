class Exam < ActiveRecord::Base
  attr_accessible :exam_name, :exam_subject, :user_id, :questions_attributes

  validates :exam_name, :user_id, presence: true

  belongs_to :user

  has_many :questions

  accepts_nested_attributes_for :questions
end
