require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  attr_writer :password_confirmation

  PRIVATE_ATTRIBUTES = %w(id password_digest)
  
  before_create :set_defaults
  validates :email, uniqueness: true, presence: true
  validate :password_confirmation, on: :create


  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def public_attributes
  	@public_attributes ||= attributes.select do
  	  |k,_v| !PRIVATE_ATTRIBUTES.include?(k)
  	end
  end

  private

  def set_defaults
  	self.counter ||= 1 
  end

  def password_confirmation
    return if password == @password_confirmation
    errors.add(:password_confirmation, "does not match password")
  end
end