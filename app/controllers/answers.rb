post "/answers" do
  if logged_in?
    answer = Answer.new(params[:answer])
    answer.user_id = session[:id]
    if answer.save
      redirect "questions/#{answer.question_id}"
    else
      session[:invalid_answer] = answer.errors.full_messages
      redirect "questions/#{answer.question_id}"
    end
  else
    session[:new_post_message] = "You must log in to answer a question."
    redirect "/login"
  end
end

get '/answers/:id/new_comment' do
  if !logged_in?
    session[:new_post_message] = "You must login to comment."
    redirect "/login"
  end
  @answer = Answer.find_by(id: params[:id])
  if @answer
    erb :'comments/new'
  else
    halt(404, "404!!!!!! Answer not found")
  end
end

post '/answers/new_comment' do
  answer = Answer.find_by(id: params[:answer_id])
  comment = Comment.new(comment_body: params[:comment_body], user_id: current_user.id)
  if comment.save
    answer.comments << comment
    redirect "/questions/#{answer.question.id}"
  else
    session[:form_error] = comment.errors.full_messages
    redirect "/questions/#{answer.question.id}/new_comment"
  end
end

post "/answers/best" do
  answer = Answer.find_by(id: params[:answer_id])
  set_best_answer(answer)
  redirect "/questions/#{answer.question.id}"
end
