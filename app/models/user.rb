
# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  officer            :boolean
#  initiate           :boolean
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#

require 'digest'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessor :password
  attr_accessible :name, :email, :officer, :initiate, :member,\
   :password, :password_confirmation, :show_email, :officer_position, :avatar
   
  default_scope :order => 'email ASC'
  
  has_many :blogposts
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  # Validations
  
  validates_confirmation_of :password, :on => :create
  validates_presence_of :password, :on => :create
  
  email_regex = /\A[\w+\-.]+@(.*)?gatech.edu\z/i
  
  validates_presence_of :name, :email
  validates_length_of :name, :maximum => 50
  validates_format_of :email, :with => email_regex
  validates_uniqueness_of :email, :case_sensitive => false
    
  def set_default_values
    self.initiate = false if self.initiate.nil?
    self.officer = false if self.officer.nil?
    self.member = false if self.member.nil?
    self.show_email = false if self.show_email.nil?
    return true
  end
  
  def self.search(search, type)
    if (search)
      if (type)
        find(:all, :conditions => ["#{type} LIKE ?", "%#{search}%"])
      else
        find(:all, :conditions => ["email LIKE ?", "%#{search}%"])
      end
    else
      find(:all)
    end
  end
  
end
