include ApplicationHelper

class AuthCodesController < ApplicationController

  before_filter :deny_unless_officer

  def new
    @authcode = AuthCode.new
  end

  def create
    @authcode = AuthCode.new(params[:auth_code])
    if @authcode.save
      flash[:success] = "Auth Code created."
      redirect_to @authcode
    else
      flash[:error] = "There were some errors."
      render :new
    end
  end

  def destroy
    @authcode = AuthCode.find(params[:id])
    if @authcode.name != "initiate" and @authcode.name != "member"
      @authcode.delete
      redirect_to auth_codes_path
    else
      flash[:error] = "Cannot delete auth_code for #{@authcode.name}"
      redirect_to @authcode
    end
  end

  def edit
    @authcode = AuthCode.find(params[:id])
  end

  def update
    @authcode = AuthCode.find(params[:id])
    @authcode.code = params[:auth_code][:code]
    if @authcode.save
      flash[:notice] = "Authcode Changed."
      redirect_to @authcode
    else
      render 'edit'
    end
  end

  def index
    @authcodes = AuthCode.all
  end

  def show
    @authcode = AuthCode.find(params[:id])
  end

end
