class PagesController < ApplicationController
  before_filter :authenticate, :only => [:admin]
  before_filter :is_officer, :only => [:admin]
  
  def home
    @title = "Home"
    @blogposts = Blogpost.paginate(:page => params[:page])
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
