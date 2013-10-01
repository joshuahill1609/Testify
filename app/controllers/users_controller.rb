class UsersController < ApplicationController

  def index
    redirect_to "/users/#{current_user.id}"
  end

  def new
    redirect_to "/users/sign_up"
  end

  def create
    
  end

  def show
    @user = current_user
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
  
  def about
    
  end

  def destroy

  end

end