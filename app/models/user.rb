require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :albums
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true

  def self.authenticate(name, secret)
    user = find_by_name(name)
    if user && user.password == secret
      return user
    end
  end

  def password
    @password = Password.new(password_digest)
  end

  def password=(secret)
    @password = Password.create(secret)
    self.password_digest = @password
  end
end