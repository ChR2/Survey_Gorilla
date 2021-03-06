#get+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
get '/' do
  erb :index
end

get '/login' do
  erb :login
end

get '/create_user' do
  erb :create_user
end

get '/allsurveys' do
  @all_surveys = Survey.all
  erb :allsurveys
end


get '/treat' do 
  erb :treat, layout: false
end

get '/take_survey/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  @type = @survey.survey_type
  @questions = @survey.questions
  erb :take_survey
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/createsurvey/:id' do 
  session[:survey_type] = params[:id]
  erb :create_survey
end

get '/question/new' do
  erb :_question_partial,layout: false
end

get '/answer/new' do
  erb :_answer,layout: false
end

get '/user/profile' do
  if logged_in?
    @completed_surveys = completed_surveys
    @created_surveys = current_user.surveys
    erb :profile
  else
    redirect('/login')
  end
end

get '/results/:id' do 
  erb :view_results
end

get '/review-survey/:id' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  erb :review_your_survey
end

get '/stats/for/:id' do
  @survey = Survey.find(params[:id])
  erb :stats
end


#POST+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

post '/login' do
  @user = User.find_by_username(params[:user][:username])

  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect('/user/profile')
  else
    @error = "Whatchu talkin bout, Willis?"
    erb :login
  end
end

post '/create_user' do  
  @user = User.new(params[:user])

  if @user.save
    session[:user_id] = @user.id
    redirect to '/user/profile'
  else
    @error = "You messed up, sucka!"
    erb :create_user
  end
end

post '/take_survey/:survey_id' do
  if logged_in?
    @survey = Survey.find(params[:survey_id])
    questions = @survey.questions
    questions.each do |question|
      if @survey.survey_type == '3'
        choice = Choice.find_or_create_by_choice_text(params[question.id.to_s.to_sym])
        choice.update_attributes(question: question)
        choice.save
        Response.create(:user_id => current_user.id,:survey => @survey, :choice_id => choice.id)    
      else
        Response.create(:user_id => current_user.id,:survey_id => @survey.id, :choice_id => params[question.id.to_s.to_sym])
      end
    end
    redirect to '/allsurveys'
  else
    redirect to '/login'
  end
end

post '/create_survey' do 
  @survey = Survey.create(name: params[:surveyname], survey_type: session[:survey_type])
  current_user.surveys << @survey
  questions = params[:questions]
  @name = ''

  questions.each do |task|
    if task.class == String                                                                       
      @name = Question.create(question_text: task)
      @survey.questions << @name
    else
      answers = task["answers"]
      answers.each do |answer|
        @name.choices << Choice.create(choice_text: answer)
      end 
    end
  end
  session[:survey_type].clear
  redirect to "/user/profile"

end

post '/upload' do
  photo = Photo.create(name: "profile",user_id: current_user.id)
  photo.file = params[:image]
  photo.save
  redirect('/user/profile')
end
