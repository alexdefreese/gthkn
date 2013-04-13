class AuthCode < ActiveRecord::Base
  attr_accessible :code, :id, :name

  validates_presence_of :name, :code
  validates_uniqueness_of :name
end
