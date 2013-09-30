class ExamsController < ApplicationController

  def index
    @exams = Exam.exam_name(params[:exam_name], params[:subject], params[:created_by])
  end

  def new
    @exam = Exam.new
    @current_user_id = current_user.id
    1.times do
      question = @exam.questions.build
      question.correct_answers.build
      3.times { question.answers.build }
    end
    
    1.times do
      true_false = @exam.true_false_questions.build
      1.times {true_false.true_false_answers.build }
    end
    
    1.times do
      @exam.essay_questions.build
    end

  end

  def create
    @exam = Exam.new(params[:exam]) 
    if @exam.save
      
      @exam.reorder_answers
      
      flash[:notice] = "Successfully created Test"
      redirect_to @exam
    else
      render :new
    end
  end
  
  #shuffles around the order of questions creating a new version of the test
  def new_version
    @old_exam = Exam.find(params[:id])
    @exam = Exam.new(@old_exam.attributes.merge({:id => nil, :created_at => nil, :updated_at => nil}))
    @exam.exam_name = @old_exam.exam_name + " v.2"
    @exam.save
    
    @old_exam.questions.each do |question|
      rand = 1 + rand(40)
      new_question = Question.new(exam_id: @exam.id, title: question.title, position: rand)
      new_question.save
      
      question.correct_answers.each do |correct_answer|
        new_correct_answer = CorrectAnswer.new(question_id: new_question.id, body: correct_answer.body)
        new_correct_answer.save
      end
      
      question.answer_orders.each do |answer_order|
        new_answer_order = AnswerOrder.new(content: answer_order.content, question_id: new_question.id)
        new_answer_order.save
      end
    end
    
    @old_exam.true_false_questions.each do |tf_question|
      rand = 1 + rand(40)
      new_tf = TrueFalseQuestion.new(content: tf_question.content, exam_id: @exam.id, position: rand)
      new_tf.save
      
      tf_question.true_false_answers.each do |tf_answer|
        new_tf_answer = TrueFalseAnswer.new(content: tf_answer.content, true_false_question_id: new_tf.id)
        new_tf_answer.save
      end
    end
    
    @old_exam.essay_questions.each do |essay|
      rand = 1 + rand(40)
      new_essay = EssayQuestion.new(content: essay.content, exam_id: @exam.id, position: rand)
      new_essay.save
    end
    
    redirect_to exams_url
  
  end

  def show
    @exam = Exam.find(params[:id])
    @questions = @exam.questions.order("position")
    @letters = ["A", "B", "C", "D", "E", "F"]
    
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ExamPdf.new(@exam, current_user)
        send_data pdf.render, filename: "test_#{@exam.exam_name}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end
  
  def answer_key
    @exam = Exam.find(params[:id])
    
    respond_to do |format|
      format.pdf do
        pdf = AnswerKeyPdf.new(@exam, current_user)
        send_data pdf.render, filename: "test_#{@exam.exam_name}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  def edit
    @exam = Exam.find(params[:id])
  end

  def update
    @exam = Exam.find(params[:id])
    if @exam.update_attributes(params[:exam])
      @exam.reorder_answers
      redirect_to @exam
    else
      render :edit
    end
  end

  def destroy
    exam = Exam.find(params[:id])
    exam.destroy

    redirect_to user_url(current_user)
  end

end