class Question < ActiveRecord::Base
  attr_accessible :exam_id, :title, :answers_attributes

  validates :title, presence: true

  belongs_to :exam
  has_many :answers

  accepts_nested_attributes_for :answers
end
