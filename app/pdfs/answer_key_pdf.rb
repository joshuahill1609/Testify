class AnswerKeyPdf < Prawn::Document

  LETTERS = ["A", "B", "C", "D", "E", "F"]

  def initialize(exam, current_user)
    super()
    @exam = exam
    @current_user = current_user
    @num_of_questions = 1
    exam_name
    place_questions
    place_footer
    
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
    @exam.questions.each do |question|
      move_down 10
      text @num_of_questions.to_s + ") " + "#{question.title}"
      place_correct_answer(question)

      @num_of_questions += 1
    end
    
    @exam.true_false_questions.each do |question|
      move_down 10
      text @num_of_questions.to_s + ") " + "#{question.content}"
      text "#{question.true_false_answers.first.content}"
      
      @num_of_questions += 1
    end
    
    @exam.essay_questions.each do |question|
      move_down 10
      text @num_of_questions.to_s + ") " + "#{question.content}"
      
      @num_of_questions += 1
    end
  end

  def place_correct_answer(question)
    move_down 5
     text "#{question.correct_answers.first.body}"
  end


  def place_footer
    text_box  "Number of Questions: #{@num_of_questions - 1}", valign: :bottom
  end

end