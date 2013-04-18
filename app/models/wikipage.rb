# == Schema Information
#
# Table name: wikipages
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  current_revision_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Wikipage < ActiveRecord::Base
  attr_accessible :current_revision_id, :id, :name
  has_many :wiki_revisions
end
