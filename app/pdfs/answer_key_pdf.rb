class AnswerKeyPdf < Prawn::Document

  LETTERS = ["A", "B", "C", "D", "E", "F"]

  def initialize(exam, current_user)
    super()
    @exam = exam
    @current_user = current_user
    @num_of_questions = 0
    exam_name
    place_questions
    
  end

  def exam_name
     text "Answer Key"
     text "Test Name: #{@exam.exam_name.capitalize}", size: 20, style: :bold
  end

  def subject
    move_down 5

    text "Teacher: #{@current_user.username.capitalize} Subject: #{@exam.exam_subject}", size: 10
  end

  
  def place_questions
    move_down 10
    i = 1
    @exam.questions.each do |question|
      move_down 10
      text i.to_s + ") " + "#{question.title}"
      place_correct_answer(question)

      @num_of_questions += 1
      i += 1
    end
  end

  def place_correct_answer(question)
    move_down 5
     text "#{question.correct_answers.first.body}"
  end


  def place_footer
    text_box "____ / #{@num_of_questions}", valign: :bottom
  end

end