class WikiRevision < ActiveRecord::Base
  attr_accessible :content, :id, :user_id
end
