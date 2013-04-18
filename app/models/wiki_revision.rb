class WikiRevision < ActiveRecord::Base
  attr_accessible :content, :id, :user_id
  belongs_to :wikipage
  belongs_to :user
end
