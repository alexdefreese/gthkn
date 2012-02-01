class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user_or_officer, :only => [:edit, :update]
  before_filter :deny_unless_officer, :only =>[:user_admin]
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def new
    @user = User.new
    @title = "Sign Up"
  end

  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end
  
  def update
    @user = User.find(params[:id])
    if params[:commit] == 'Cancel'
      flash[:notice] = "Cancelled Edit."
      redirect_to @user
    else
      if @user.update_attributes(params[:user])
        flash[:success] = "Profile updated."
        redirect_to @user
      else
        @title = "Edit user"
        render 'edit'
      end
    end
  end

  def delete
  end
  
  def index
  end
  
  def user_admin
    @users = User.all
    @title = "User Admin"
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
