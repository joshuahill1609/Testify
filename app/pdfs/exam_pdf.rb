class ExamPdf < Prawn::Document

  LETTERS = ["A", "B", "C", "D", "E", "F"]

  def initialize(exam, current_user)
    super()
    @exam = exam
    @current_user = current_user
    @num_of_questions = 1
    exam_name
    student_header
    place_questions
  end

  def exam_name
     text "#{@exam.exam_name.capitalize}", size: 20, style: :bold
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
      move_down 5
      place_answers(question)

      @num_of_questions += 1
    end
    
    @exam.true_false_questions.each do |question|
      move_down 10
      text @num_of_questions.to_s + ") " + "#{question.content}"
      indent(20) do
        text "___ True ___ False"
      end
      
      @num_of_questions += 1
    end
    
    start_new_page
    text "Essay Questions. Write answer in space provided."
    move_down 10
    @exam.essay_questions.each do |question|
      text @num_of_questions.to_s + ") " + "#{question.content}"
      move_down 150
      
      @num_of_questions += 1
    end
    
  end

  #not using - switched this out for place_answers method
  def place_correct_answer(question)
    move_down 5
    indent(20) do
      text "A) " + "#{question.correct_answers.first.body}"
    end
  end


  def place_answers(question)
    j = 0
    question.answer_orders.each do |answer|
      move_down 5
      indent(20) do
        text "#{LETTERS[j]}" + ") " + "#{answer.content}"
      end
      j += 1
    end
  end

  #not using - will impliment later
  def place_footer
    text_box "____ / #{@num_of_questions - 1}", valign: :bottom
  end

end