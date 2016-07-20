get '/questions' do
  @questions = Question.all
  erb :"questions/index"
end

get '/questions/new' do
  if current_user
    erb :'questions/new'
  else
    session[:new_post_message] = "You must be logged in to ask a question"
    redirect '/login'
  end
end

post '/questions' do
  @question = Question.new(params[:question])
  @question.user_id = session[:id]

   if @question.save
    redirect "/questions/#{@question.id}"
  else
    session[:form_error] = @question.errors.full_messages
    redirect "/questions/new"
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  if @question
    erb :'questions/show'
  else
    halt(404, "Question not found")
  end
end
