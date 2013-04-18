# == Schema Information
#
# Table name: wiki_revisions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  wikipage_id :integer
#

class WikiRevision < ActiveRecord::Base
  attr_accessible :content, :id, :user_id
  belongs_to :wikipage
  belongs_to :user
end
