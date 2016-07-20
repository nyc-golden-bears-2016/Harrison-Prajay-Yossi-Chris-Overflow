get '/questions' do
  if params[:interesting]
    @questions = Question.all.order(created_at: :desc)
  elsif params[:views]
    @questions = Question.all.order(view_count: :desc)
  elsif params[:answers]
    @questions = Question.all.to_a.sort {|q1,q2| q2.answers.count <=> q1.answers.count }
  elsif params[:votes]
    @questions = Question.all.to_a.sort {|q1,q2| count_votes(q2) <=> count_votes(q1) }
  else
    @questions = Question.all
  end
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
    @question.view_count += 1
    @question.save
    erb :'questions/show'
  else
    halt(404, "404!!!!!! Question not found")
  end
end

get '/questions/:id/new_comment' do
  if !logged_in?
    session[:new_post_message] = "You must login to comment."
    redirect "/login"
  end
  @question = Question.find_by(id: params[:id])
  if @question
    erb :'comments/new'
  else
    halt(404, "404!!!!!! Question not found")
  end
end

post '/questions/new_comment' do
  question = Question.find_by(id: params[:question_id])
  comment = Comment.new(comment_body: params[:comment_body], user_id: current_user.id)
  if comment.save
    question.comments << comment
    redirect "/questions/#{question.id}"
  else
    session[:form_error] = comment.errors.full_messages
    redirect "/questions/#{question.id}/new_comment"
  end
end
