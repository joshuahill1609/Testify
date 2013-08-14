class Exam < ActiveRecord::Base
  attr_accessible :exam_name, :exam_subject, :user_id, :questions_attributes, :true_false_questions_attributes, :essay_questions_attributes, 
                  :tag_ids, :grade_level_ids

  validates :exam_name, :user_id, presence: true

  belongs_to :user

  has_many :questions, order: :position, dependent: :destroy
  has_many :examtags
  has_many :tags, through: :examtags

  has_many :exam_grade_levels
  has_many :grade_levels, through: :exam_grade_levels

  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true

  has_many :true_false_questions, order: :position, dependent: :destroy
  
  accepts_nested_attributes_for :true_false_questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
  has_many :essay_questions, order: :position, dependent: :destroy
  
  accepts_nested_attributes_for :essay_questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  # class method for search bar on /exams
  def self.exam_name(exam_name, subject, created_by)
    if exam_name
     Exam.joins("INNER JOIN users ON users.id = exams.user_id").find(:all, :conditions => ['exam_name LIKE ? AND exam_subject LIKE ? AND username LIKE ?', "%#{exam_name}%", "%#{subject}%", "%#{created_by}%"])
    else
     find(:all)
    end
  end

  #combines correct answer with answers and shuffles order
  def reorder_answers
    answer_order = []
    self.questions.each do |q|
      AnswerOrder.destroy_all(:question_id => q.id)
      q.answers.each do |a|
        answer_order << a.body
      end
      q.correct_answers.each do |c|
        answer_order << c.body
      end
    
      answer_order = answer_order.shuffle.shuffle.shuffle
    
      answer_order.each do |i|
        AnswerOrder.create!(:content => i, :question_id => q.id)
      end
      answer_order = []
    end  
  end

end
