class TakenSurvey < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  has_many :responses
  has_many :questions, through: :survey
end
