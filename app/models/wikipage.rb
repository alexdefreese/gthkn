class Wikipage < ActiveRecord::Base
  attr_accessible :current_revision_id, :id, :name
  has_many :wiki_revisions
end
