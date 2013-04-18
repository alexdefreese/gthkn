# == Schema Information
#
# Table name: initiation_requirements
#
#  id                      :integer          not null, primary key
#  professor_invited       :boolean
#  dues_paid               :boolean
#  lab_chip_party_attended :boolean
#  service_project         :boolean
#  user_id                 :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class InitiationRequirement < ActiveRecord::Base
  attr_accessible :dues_paid, :id, :lab_chip_party_attended, 
                  :professor_invited, :service_project, :user_id
  belongs_to :user
end
