module ApplicationHelper

  def log_in(username, password)
    @user = User.find_by_username(username)
    if (@user && @user.authenticate(password))
      @user.session_token = SecureRandom.urlsafe_base64(6)
      @user.save!

      session[:session_token] = @user.session_token
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

  def link_to_add_fields(name, f, association, correct_answer_child = nil, child_association = nil)
    new_object = f.object.send(association).klass.new

    if correct_answer_child
      1.times { new_object.send(correct_answer_child).build }
    end
    
    if child_association
      3.times{ new_object.send(child_association).build } #Builds 3 Answers
      #new_object.send(child_association).build #Builds 1 Answer
    end

    id = new_object.object_id

    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    
    x = ''
    if name == "Add Question"
      x = "add-mc"
    elsif name == "Add True/False Question"
      x = "add-tf"
    elsif name == "Add Essay Question"
      x = "add-es"
    elsif name == "Add Answer"
      x = "add-ans"
    end

    link_to(name, '#', class: "add_fields #{x}", data: {id: id, fields: fields.gsub("\n", "")})
  end
  
end
