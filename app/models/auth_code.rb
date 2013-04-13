class AuthCode < ActiveRecord::Base
  attr_accessible :code, :id, :name
end
