
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
  attr_accessor :password
  attr_accessible :name, :email, :officer, :initiate, :member,\
   :password, :password_confirmation, :show_email, :officer_position
  
  has_many :blogposts
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  validates_confirmation_of :password
  validates_presence_of :password
  
  email_regex = /\A[\w+\-.]+@(gatech.edu|mail.gatech.edu)\z/i
  
  validates_presence_of :name, :email
  validates_length_of :name, :maximum => 50
  validates_format_of :email, :with => email_regex
  validates_uniqueness_of :email, :case_sensitive => false
  
  before_save :set_default_values, :encrypt_password
  
  def set_default_values
    self.initiate = false if self.initiate.nil?
    self.officer = false if self.officer.nil?
    self.member = false if self.member.nil?
    self.show_email = false if self.show_email.nil?
    return true
  end
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end
  
  private
    def encrypt_password
      unless password.nil?
        self.salt = make_salt
        self.encrypted_password = encrypt(password)
      end
    end
    
    def encrypt(string)
      secure_hash("#{salt}#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
