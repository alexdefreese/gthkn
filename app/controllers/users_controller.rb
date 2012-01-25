class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def new
    @user = User.new
    @title = "Sign Up"
  end

  def update
  end

  def delete
  end
  
  def index
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Thank you for signing up."
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

end
