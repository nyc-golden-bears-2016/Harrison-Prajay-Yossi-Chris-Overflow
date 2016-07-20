get "/login" do
  erb :"user/login"
end

post "/login" do
  user = User.find_by(email: params[:email])
  if user
    if user.authenticate(params[:password])
      session.clear
      session[:id] = user.id
      redirect "/"
    else
      session[:invalid_login] = "Email and Password mismatch"
      redirect "/login"
    end
  else
    session[:invalid_login] = "Email and Password mismatch"
    redirect "/login"
  end
end


get "/logout" do
  session.clear
  redirect "/"
end
