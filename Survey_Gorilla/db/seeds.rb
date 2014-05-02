require 'faker'

User.destroy_all
Survey.destroy_all
TakenSurvey.destroy_all
Question.destroy_all
Response.destroy_all
Choice.destroy_all

5.times do
  User.create(username: Faker::Internet.user_name, password_hash: Faker::Lorem.word)
end

users = User.all

20.times do
  survey = Survey.create(name: Faker::Lorem.word, user_id: users.sample.id)
  5.times do
    question = Question.create(text: Faker::Company.catch_phrase + "?", survey_id: survey.id)
    4.times do
      choice = Choice.create(text: Faker::Address.city, question_id: question.id)
    end
  end
end

users.each do |user|
  takensurvey = TakenSurvey.create(user_id: user.id, survey_id: Survey.all.sample.id)
  takensurvey.survey.questions.each do |question|
    Response.create(question_id: question.id, choice_id: question.choices.sample.id, taken_survey_id: takensurvey.id)
  end
end
