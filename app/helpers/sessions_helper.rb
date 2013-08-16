module SessionsHelper
  
  def login(user)
    cookies.permanent[:session_token] = user.create_session_token
    self.current_user = user
  end
  
  def logout
    cookies.delete(:session_token)
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= User.find_by_session_token(cookies[:session_token])
  end
  
  def logged_in?
    !!current_user
  end
end
