class BlogpostsController < ApplicationController
  
  before_filter :deny_unless_officer, only: [:new, :create, :edit, :update, :delete]
  
  def new
    @title = "New Blog Post"
    @blogpost = Blogpost.new if current_user_is_officer?
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

  def index
    @blogposts = Blogpost.paginate(:page => params[:page], :per_page => 10)
  end

  def delete
  end

end
