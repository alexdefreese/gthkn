class InitiationRequirementsController < ApplicationController
  def create
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
