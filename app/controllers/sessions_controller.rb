class SessionsController < ApplicationController

  def new

  end

  def create
    p "params!!!!!!!!!!!!!!!!!!!!!!!!!!"
    p params
    p params[:user][:username]
    log_in(params[:user][:username], params[:user][:password])
  end

  def destroy
    log_out
    redirect_to "/"
  end

end