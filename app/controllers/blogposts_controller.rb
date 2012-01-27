class BlogpostsController < ApplicationController
  
  before_filter :is_officer
  
  def new
    @blogpost = Blogpost.new if is_officer?
  end
  
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
    @blogpost = Blogpost.find(params[:id])
    @title = "Edit Blog Post"
  end

  def update
    @blogpost = Blogpost.find(params[:id])
    if @blogpost.update_attributes(params[:blogpost])
      flash[:success] = "Post Updated."
      redirect_to root_path
    else
      @title = "Edit Blog Post"
      render 'edit'
    end
  end

  def delete
  end

end
