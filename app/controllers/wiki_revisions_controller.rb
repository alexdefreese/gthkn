include ApplicationHelper
class WikiRevisionsController < ApplicationController
  before_filter :deny_unless_officer
  def new
    @wikipage = Wikipage.find(params[:wikipage_id])
    @latest_revision = WikiRevision.find(@wikipage.current_revision_id)
  end

  def create
    @wikipage = Wikipage.find(params[:wikipage_id])
    revision = WikiRevision.new
    revision.content = params[:content]
    revision.save
    @wikipage.wiki_revisions << revision
    @wikipage.current_revision_id = revision.id
    current_user.wiki_revisions << revision
    @wikipage.save
    redirect_to @wikipage, notice: "Page Edited"
  end

  def index
    @wikipage = Wikipage.find(params[:wikipage_id])
    @revisions = @wikipage.wiki_revisions
  end
end
