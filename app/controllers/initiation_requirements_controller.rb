class InitiationRequirementsController < ApplicationController

  def new
    if user_signed_in? and current_user.officer?
      @user = User.find(params[:id])
      @user.initiate = true;
      @user.build_initiation_requirement( { professor_invited: false, 
          dues_paid: false, lab_chip_party_attended: false, service_project: false})
      @user.save
      flash[:success] = "User updated to initiate"
      redirect_to user_admin_path
    end
  end

  def create
    if user_signed_in?
      if params[:auth_code] == AuthCode.find_by_name("initiate")
        current_user.initiate = true;
        current_user.build_initiation_requirement( { professor_invited: false, 
          dues_paid: false, lab_chip_party_attended: false, service_project: false})
        flash[:success] = "You are now an initiate of HKN"
        redirect_to current_user
      else
        flash[:error] = "Wrong Authentication Code"
        render :new
      end
    end
  end

  def update
    @requirement = InitiationRequirement.find(params[:id])
    saved = false
    if @requirement.update_attributes(params[:initiation_requirement])
      saved = true
    end
    respond_to do |format|
      format.html {
        if saved
          flash[:success] = "Saved"
          redirect_to initiation_path
        else
          redirect_to initiation_path
        end
      }
      format.js {
      }
    end
  end

  def delete
  end
end
