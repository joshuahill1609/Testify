class Question < ActiveRecord::Base
  attr_accessible :exam_id, :title, :answers_attributes, :correct_answers_attributes

  validates :title, presence: true

  belongs_to :exam

  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:body].blank? }, :allow_destroy => true

  has_many :correct_answers, dependent: :destroy
  accepts_nested_attributes_for :correct_answers, :reject_if => lambda { |a| a[:body].blank? }, :allow_destroy => true

end
