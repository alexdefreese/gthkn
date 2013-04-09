class InitiationRequirement < ActiveRecord::Base
  attr_accessible :dues_paid, :id, :lab_chip_party_attended, 
                  :professor_invited, :service_project, :user_id
  belongs_to :user
end
