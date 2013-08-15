class ExamPdf < Prawn::Document

  LETTERS = ["B", "C", "D", "E", "F"]

  def initialize(exam, current_user)
    super()
    @exam = exam
    @current_user = current_user
    @num_of_questions = 1
    exam_name
    subject
    student_header
    place_questions
    place_footer
  end

  def exam_name
     text "Test Name: #{@exam.exam_name.capitalize}", size: 20, style: :bold
  end

  def subject
    move_down 5

    text "Teacher: #{@current_user.username.capitalize} Subject: #{@exam.exam_subject}", size: 10
  end

  def student_header
    move_down 10
    text "Name_________________"
  end

  def place_questions
    move_down 10

    @exam.questions.each do |question|
      move_down 10
      text @num_of_questions.to_s + ") " + "#{question.title}"
      place_correct_answer(question)
      place_answers(question)

      @num_of_questions += 1
    end
    
    @exam.true_false_questions.each do |question|
      move_down 10
      text @num_of_questions.to_s + ") " + "#{question.content}"
      text "___ True ___ False"
      
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
    text "A) " + "#{question.correct_answers.first.body}"
  end


  def place_answers(question)
    j = 0
    question.answers.each do |answer|
      move_down 5
      text "#{LETTERS[j]}" + ") " + "#{answer.body}"
      j += 1
    end
  end

  def place_footer
    text_box "____ / #{@num_of_questions - 1}", valign: :bottom
  end

end