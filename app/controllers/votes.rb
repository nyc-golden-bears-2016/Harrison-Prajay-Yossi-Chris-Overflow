post "/upvote/answers" do
  answer = Answer.find(params[:answer_id])
  if logged_in?
    already_voted = answer.votes.where(user_id: session[:id])
    answer.votes << Vote.new({value: 1, user_id: current_user.id}) if already_voted.empty?
  elsif !xhr?
    session[:vote_error] = "You must log in to vote"
  end
  if !request.xhr?
    redirect "/questions/#{answer.question_id}"
  end
end

post "/downvote/answers" do
  answer = Answer.find(params[:answer_id])
  if logged_in?
    already_voted = answer.votes.where(user_id: current_user.id)
    answer.votes << Vote.new({value: -1, user_id: current_user.id}) if already_voted.empty?
  elsif !xhr?
    session[:vote_error] = "You must log in to vote"
  end
  if !request.xhr?
    redirect "/questions/#{answer.question_id}"
  end
end

post "/upvote/questions" do
  question = Question.find(params[:question_id])
  if logged_in?
    already_voted = question.votes.where(user_id: session[:id])
    question.votes << Vote.new({value: 1, user_id: current_user.id}) if already_voted.empty?
  elsif !xhr?
    session[:vote_error] = "You must log in to vote"
  end
  if !request.xhr?
    redirect "/questions/#{question.id}"
  end
end

post "/downvote/questions" do
  question = Question.find(params[:question_id])
  if logged_in?
    already_voted = question.votes.where(user_id: current_user.id)
    question.votes << Vote.new({value: -1, user_id: current_user.id}) if already_voted.empty?
  elsif !xhr?
    session[:vote_error] = "You must log in to vote"
  end
  if !request.xhr?
    redirect "/questions/#{question.id}"
  end
end
