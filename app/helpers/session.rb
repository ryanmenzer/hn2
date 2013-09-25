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

  def post_voted?(post_id)
    if session? 
      result = Postvote.where("user_id = #{session_user_id} AND post_id = #{post_id}")
      result.length == 0 ? false : true
    end
  end

  def comment_voted?(comment_id)
    if session? 
      result = Commentvote.where("user_id = #{session_user_id} AND comment_id = #{comment_id}")
      result.length == 0 ? false : true
    end
  end

end
