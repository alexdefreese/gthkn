class PagesController < ApplicationController
  #before_filter :authenticate, :only => [:admin]
  #before_filter :deny_unless_officer, :only => [:admin]
  
  def home
    @title = "Home"
    @blogposts = Blogpost.paginate(:page => params[:page], :per_page => 10)
  end

  def contact
    @title = "Contact Us"
  end

  def officers
    @title = "Officers"
    @users = User.all
  end

  def events
    @title = "Events"
  end

  def corporate
    @title = "Corporate Relations"
  end
  
  def about
    @title = "About"
  end
  
  def admin
    @title = "Admin Home"
  end

end
