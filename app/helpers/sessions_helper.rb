module SessionsHelper
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    self.current_user = user
  end
  
  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= user_from_remember_token
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def deny_access
    flash[:notice] = "Please sign in to access this page."
    redirect_to signin_path
  end
  
  def authenticate
    deny_access unless signed_in?
  end
  
  def current_user_is_officer?
    return false if current_user.nil?
    current_user.officer
  end
  
  def deny_unless_officer
    redirect_to root_path unless current_user.officer
  end
  
  private
    
    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end
    
    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
end
