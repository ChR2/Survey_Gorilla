require 'faker'
# User.create!(:username => "nprater",:password => "password",:password_confirmation => "password",:email => "prater.nick@gmail.com")
# User.create!(:username => "eugene",:password => "password",:password_confirmation => "password",:email => "eugene@eugene.com")
# User.create!(:username => "wendy",:password => "password",:password_confirmation => "password",:email => "wendy@wendy.com")

# Survey.create!(:name => "Survey 1",:user_id => 1)
# Survey.create!(:name => "Survey 2",:user_id => 2)
# Survey.create!(:name => "Survey 3",:user_id => 3)

# Question.create!(:survey_id => 1,:question_text => "How do you feel about that?")
# Question.create!(:survey_id => 1,:question_text => "What color is the sky?")
# Question.create!(:survey_id => 1,:question_text => "What color is dirt?")
# Question.create!(:survey_id => 2,:question_text => "What NFL team is the best?")
# Question.create!(:survey_id => 2,:question_text => "Who is your favorite player?")
# Question.create!(:survey_id => 2,:question_text => "What is your favorite car?")
# Question.create!(:survey_id => 3,:question_text => "What did you find most confusing?")
# Question.create!(:survey_id => 3,:question_text => "Who is your favorite superhero?")
# Question.create!(:survey_id => 3,:question_text => "What do you want to work on most?")

# Choice.create!(:question_id => 1,:choice_text => "Great")
# Choice.create!(:question_id => 1,:choice_text => "Bad")
# Choice.create!(:question_id => 1,:choice_text => "Neutral")
# Choice.create!(:question_id => 1,:choice_text => "Ok...I guess")
# Choice.create!(:question_id => 2,:choice_text => "Green")
# Choice.create!(:question_id => 2,:choice_text => "Blue")
# Choice.create!(:question_id => 2,:choice_text => "Orange")
# Choice.create!(:question_id => 2,:choice_text => "Yellow")
# Choice.create!(:question_id => 3,:choice_text => "Red")
# Choice.create!(:question_id => 3,:choice_text => "Purple")
# Choice.create!(:question_id => 3,:choice_text => "Light Blue")
# Ch10oice.create!(:question_id => 3,:choice_text => "Yellow")
# Choice.create!(:question_id => 4,:choice_text => "Browns")
# Choice.create!(:question_id => 4,:choice_text => "Bears")
# Choice.create!(:question_id => 4,:choice_text => "Cowboys")
# Choice.create!(:question_id => 4,:choice_text => "Not Browns")
# Choice.create!(:question_id => 5,:choice_text => "Trent Richardson")
# Choice.create!(:question_id => 5,:choice_text => "Andrew Luck")
# Choice.create!(:question_id => 5,:choice_text => "Eugene")
# Choice.create!(:question_id => 5,:choice_text => "Richard")
# Choice.create!(:question_id => 6,:choice_text => "Hunk of Junk I'm Driving Now")
# Choice.create!(:question_id => 6,:choice_text => "S4")
# Choice.create!(:question_id => 6,:choice_text => "Civic")
# Choice.create!(:question_id => 6,:choice_text => "Car")
# Choice.create!(:question_id => 7,:choice_text => "jQuery")
# Choice.create!(:question_id => 7,:choice_text => "Models")
# Choice.create!(:question_id => 7,:choice_text => "Men")
# Choice.create!(:question_id => 7,:choice_text => "Women")
# Choice.create!(:question_id => 8,:choice_text => "Spider Man")
# Choice.create!(:question_id => 8,:choice_text => "Eugene")
# Choice.create!(:question_id => 8,:choice_text => "Maria")
# Choice.create!(:question_id => 8,:choice_text => "Wendy")
# Choice.create!(:question_id => 9,:choice_text => "World Peace")
# Choice.create!(:question_id => 9,:choice_text => "Your Pecs")
# Choice.create!(:question_id => 9,:choice_text => "Your Teef")
# Choice.create!(:question_id => 9,:choice_text => "HTML")

# Response.create!(:user_id => 1,:choice_id => rand(1..36))
# Response.create!(:user_id => 1,:choice_id => rand(1..36))
# Response.create!(:user_id => 1,:choice_id => rand(1..36))
# Response.create!(:user_id => 2,:choice_id => rand(1..36))
# Response.create!(:user_id => 2,:choice_id => rand(1..36))
# Response.create!(:user_id => 2,:choice_id => rand(1..36))
# Response.create!(:user_id => 3,:choice_id => rand(1..36))
# Response.create!(:user_id => 3,:choice_id => rand(1..36))
# Response.create!(:user_id => 3,:choice_id => rand(1..36))
10.times do 
  user = User.create!(:username => Faker::Name.first_name, :password => "password",:password_confirmation => "password",:email => Faker::Internet.email)
  10.times do
    survey = user.surveys.build(name: Faker::Lorem.words(3).join(' '), survey_type: rand(1..4))
    10.times do 
      question = survey.questions.build(question_text: Faker::Lorem.words(rand(10..15)).join(" "))
      4.times do
        choice = question.choices.build(choice_text: Faker::Lorem.words(rand(2..5)).join(' '))
        choice.save
      end
      question.save
    end
    survey.save
  end
  user.save
end

User.all.each do |user|
  10.times do |index|
    Survey.find(index + 1).questions.each do |question|
      Response.create(:user_id => user.id,:survey_id=> question.survey.id, :choice_id => question.choices.sample.id)
    end
  end
end



