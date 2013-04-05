# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  description   :text
#  date_occurred :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Event < ActiveRecord::Base
  attr_accessible :date_occurred, :description, :id, :title

  before_destroy { |object| object.users.delete }

  default_scope :order => 'date_occurred DESC'

  validates_presence_of :title
  validates_presence_of :date_occurred

  has_and_belongs_to_many :users
end
