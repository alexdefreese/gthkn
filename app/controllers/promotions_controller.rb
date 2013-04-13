include ApplicationHelper

class PromotionsController < ApplicationController
  before_filter :deny_unless_officer, only: [:initiation]

  def initiation
    @users = User.all
  end

  def request_member_promtion
    if user_signed_in? and current_user.officer?
      @user = User.find(params[:id])
      if not @user.nil?
        @user.member = true;
        @user.initiate = false;
        @user.save
        redirect_to user_admin_path
      end
    end
  end

  def member_promote
    if user_signed_in? 
      if params[:code] == AuthCode.find_by_name('member').code
        current_user.member = true
        current_user.save
        flash[:success] = 'You are now a full member of HKN!'
        redirect_to current_user;
      else
        flash[:error] = "Wrong Auth Code. Please try again."
        render 'request_member_promotion'
      end
    end
  end

end
