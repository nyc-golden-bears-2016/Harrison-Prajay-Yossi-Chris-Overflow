post "/answers" do
  if logged_in?
    answer = Answer.new(params[:answer])
    answer.user_id = session[:id]
    if answer.save
      redirect "question/#{answer.question_id}"
    else
      session[:invalid_answer] = answer.errors.full_messages
      redirect "question/#{answer.question_id}"
    end
  else
    session[:new_post_message] = "You must log in to answer a question."
    redirect "/login"
  end
end
