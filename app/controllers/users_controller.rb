class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user_or_officer, :only => [:edit, :update]
  before_filter :deny_unless_officer, :only =>[:user_admin]
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def user_admin
    @users = User.paginate(:page => params[:page], :per_page => 40)
    @title = "User Admin"
  end
  
  def user_admin_search
    @users = User.search(params[:search], params[:type])
    @title = "Admin Search Results"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Thank you for signing up."
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  private
    
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def correct_user_or_officer
      if !current_user_is_officer?
        correct_user
      end
    end

end
