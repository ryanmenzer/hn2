helpers do

  def session?
    session[:user_id] != nil
  end

  def session_user_id
    session[:user_id] if session?
  end

  def session_user
    User.find(session[:user_id]) if session?
  end


end
