class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      log_in(params[:user][:username], params[:user][:password])
      redirect_to "/users/#{current_user.id}/edit"
    end
  end

  def show
    @user = User.find(params[:id])
    @exams = Exam.find(:all, :conditions => {:user_id => (current_user.id)})
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to user_url(@user)
    else
      redirect_to new_user_url
    end
  end

  def destroy

  end

end