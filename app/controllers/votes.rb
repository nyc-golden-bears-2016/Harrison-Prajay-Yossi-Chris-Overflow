post "/upvote/answers" do
  answer = Answer.find(params[:answer_id])
  if logged_in?
    already_voted = answer.votes.where(user_id: session[:id])
    answer.votes << Vote.new({value: 1, user_id: current_user.id}) if already_voted.empty?
  else
    session[:vote_error] = "You must log in to vote"
  end
  redirect "/questions/#{answer.question_id}"
end

post "/downvote/answers" do
  answer = Answer.find(params[:answer_id])
  if logged_in?
    already_voted = answer.votes.where(user_id: current_user.id)
    answer.votes << Vote.new({value: -1, user_id: current_user.id}) if already_voted.empty?
  else
    session[:vote_error] = "You must log in to vote"
  end
  redirect "/questions/#{answer.question_id}"
end
