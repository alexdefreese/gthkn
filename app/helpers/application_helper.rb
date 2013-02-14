# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title
    base_title = "GT HKN"
    
    if @title.nil?
      base_title
    else
      "#{base_title} | #{h(@title)}"
    end
  end
  
  def deny_access
    flash[:notice] = "Please sign in to access this page"
    redirect_to signin_path
  end
  
  def authenticate
    deny_access unless user_signed_in?
  end
  
  def current_user_is_officer?
    return false if !user_signed_in?
    current_user.officer
  end
  
  def deny_unless_officer
    redirect_to root_path unless current_user_is_officer?
  end
  
end
