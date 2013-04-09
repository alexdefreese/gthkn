class InitiationController < ApplicationController
  def index
    @users = User.all
  end
end
