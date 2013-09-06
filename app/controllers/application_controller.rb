class ApplicationController < ActionController::Base
  protect_from_forgery

  include ApplicationHelper
  
  def after_sign_in_path_for(resource)
    users_path
  end
end
