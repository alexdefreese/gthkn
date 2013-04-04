class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:edit, :update]
  before_filter :correct_user_or_officer, :only => [:edit, :update]
  before_filter :deny_unless_officer, :only =>[:user_admin]
  
  def show
    redirect_to root_path if params[:id] == "sign_out"
    @user = User.find(params[:id])
    @title = @user.name
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile Updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def user_admin
    @users = User.paginate(:page => params[:page], :per_page => 40)
    @title = "User Admin"
  end
  
  def user_admin_search
    @users = User.search(params[:search], params[:type])
    @title = "Admin Search Results"
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user == @user
  end

  private

    def correct_user_or_officer
      if !current_user.officer
        correct_user
      end
    end

end
