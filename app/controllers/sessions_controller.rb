class SessionsController < ApplicationController
  
  before_filter :deny_unless_officer, :only =>[]

  def new
    @title = "Sign in"
  end
  
  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      sign_in user
      redirect_to user unless current_user_is_officer?
      redirect_to admin_path if current_user_is_officer?
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end


end
