class BlogpostsController < ApplicationController
  
  before_filter :is_officer
  
  def create
    @blogpost = current_user.blogposts.build(params[:blogpost])
    if @blogpost.save
      flash[:success] = "Blog Post Created."
      redirect_to root_path
    else
      render 'pages/home'
    end
  end
  
  def edit
  end

  def update
  end

  def delete
  end

end
