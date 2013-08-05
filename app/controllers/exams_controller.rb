class ExamsController < ApplicationController

  def index
    @exams = Exam.all
  end

  def new
    @exam = Exam.new
    @current_user = current_user
    @tags = Tag.all
  end

  def create
    @exam = Exam.new(params[:exam])
    p params
    if @exam.save
      redirect_to @exam
    else
      render :new
    end
  end

  def show
    @exam = Exam.find(params[:id])
    @questions = Question.where(exam_id = @exam.id)
  end

  def edit

  end

  def update

  end

  def destroy

  end

end