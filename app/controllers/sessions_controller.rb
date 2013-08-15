class SessionsController < ApplicationController

  def new

  end

  def create
    log_in(params[:user][:username], params[:user][:password])
    if current_user
      redirect_to @user
    else
      redirect_to new_user_url
    end
  end

  def destroy
    log_out
    redirect_to "/"
  end

end