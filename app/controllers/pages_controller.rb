class PagesController < ApplicationController
  def home
    @title = "Home"
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

end
