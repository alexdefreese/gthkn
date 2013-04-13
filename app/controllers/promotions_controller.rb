include ApplicationHelper

class PromotionsController < ApplicationController
  before_filter :deny_unless_officer, only: [:initiation]

  def initiation
    @users = User.all
  end

end
