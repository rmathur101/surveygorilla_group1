class TakenSurvey < ActiveRecord::Base
  belongs_to :user
  has_many :responses
  has_many :questions, through: :surveys
  belongs_to :survey

end
