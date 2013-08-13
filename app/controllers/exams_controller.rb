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

  end

  def create
    @exam = Exam.new(params[:exam])
    if @exam.save
      flash[:notice] = "Successfully created Test"
      redirect_to @exam
    else
      render :new
    end
  end

  def show
    @exam = Exam.find(params[:id])
    @questions = Question.where(exam_id = @exam.id)
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

  def edit
    @exam = Exam.find(params[:id])
  end

  def update
    @exam = Exam.find(params[:id])
    if @exam.update_attributes(params[:exam])

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