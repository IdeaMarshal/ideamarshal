class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation
  
  has_secure_password
  
  validates_presence_of :username
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password, :if => Proc.new {|user| !user.password.blank?}
end
