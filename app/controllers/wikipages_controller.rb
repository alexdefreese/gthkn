include ApplicationHelper

class WikipagesController < ApplicationController
  before_filter :deny_unless_officer

  def create
    @wikipage = Wikipage.new
    @wikipage.name = params[:name]
    initial_revision = WikiRevision.new
    initial_revision.content = params[:content]
    initial_revision.save
    initial_revision.reload
    current_user.wiki_revisions << initial_revision
    @wikipage.wiki_revisions << initial_revision
    @wikipage.current_revision_id = initial_revision.id
    if @wikipage.save
      flash[:success] = "Page created."
      redirect_to @wikipage
    else
      render :new
    end
  end

  def new
  end

  def destroy
    @wikipage = Wikipage.find(p arams[:id])
    @wikipage.wiki_revisions.delete_all
    @wikipage.delete
    flash[:notice] = "Page Destroyed"
    redirect_to wikipages_path
  end

  def show
    @wikipage = Wikipage.find(params[:id])
  end

  def index
    @wikipages = Wikipage.paginate(:page => params[:page], :per_page => 40)
  end
end
