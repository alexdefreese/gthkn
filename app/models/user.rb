# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  officer    :boolean
#  initiate   :boolean
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :name, :email
  
  email_regex = /\A[\w+\-.]+@(gatech.edu|mail.gatech.edu)\z/i
  
  validates_presence_of :name, :email
  validates_length_of :name, :maximum => 50
  validates_format_of :email, :with => email_regex
  validates_uniqueness_of :email, :case_sensitive => false
end
