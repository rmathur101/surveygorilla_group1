class User < ActiveRecord::Base
  has_many :surveys
  has_many :taken_surveys
  has_many :responses, through: :taken_surveys
end
