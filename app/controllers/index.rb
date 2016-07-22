get '/' do
  redirect '/questions'
end

post '/user' do
  if request.xhr?
    if logged_in?
      return current_user.username
    end
  else
    halt(403, "YOU SHALL NOT PASS!!!!!!")
  end
end
