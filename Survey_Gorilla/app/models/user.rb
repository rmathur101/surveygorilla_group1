class User < ActiveRecord::Base
  validates :username, uniqueness: :true

  include BCrypt

  has_many :surveys
  has_many :taken_surveys
  has_many :responses, through: :taken_surveys
  # has_secure_password

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(user, password)
    #see if user and passwor match
  end
end
