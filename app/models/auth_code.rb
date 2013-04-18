# == Schema Information
#
# Table name: auth_codes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  code       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AuthCode < ActiveRecord::Base
  attr_accessible :code, :id, :name

  validates_presence_of :name, :code
  validates_uniqueness_of :name
end
