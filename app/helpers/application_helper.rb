module ApplicationHelper

  def log_in(username, password)
    p "username"
    p username
    p password

    @user = User.find_by_username(username)
    p "user!!"
    p @user
    if (@user && @user.authenticate(password))
      p "now here!!!!!"
      @user.session_token = SecureRandom.urlsafe_base64(6)
      @user.save!

      session[:session_token] = @user.session_token
      redirect_to @user
    else
      redirect_to new_user_url
    end
  end

  def log_out
    @user = current_user
    @user.session_token = nil

    session[:session_token] = nil
  end


  def current_user
    @current_user || User.find_by_session_token(session[:session_token])
  end

end
