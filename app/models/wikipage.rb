class Wikipage < ActiveRecord::Base
  attr_accessible :current_revision_id, :id, :name
end
