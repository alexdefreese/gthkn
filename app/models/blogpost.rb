class Blogpost < ActiveRecord::Base
  attr_accessible :content, :title
  
  validates_presence_of :content, :user_id
  
  default_scope :order => 'created_at DESC'
  
  belongs_to :user
  
end
