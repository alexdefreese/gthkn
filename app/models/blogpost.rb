# == Schema Information
#
# Table name: blogposts
#
#  id         :integer          not null, primary key
#  content    :text(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string(255)
#

class Blogpost < ActiveRecord::Base
  attr_accessible :content, :title
  
  validates_presence_of :content, :user_id
  
  default_scope :order => 'created_at DESC'
  
  belongs_to :user
  
end
