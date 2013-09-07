require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_secure_password

  has_one :photo
  has_many :responses
  has_many :surveys
  has_many :choices, through: :responses

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password_digest, presence: true
  
end
