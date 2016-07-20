get "/register" do
  erb :"user/register"
end

post "/register" do
  new_user = User.new(params[:user])
  new_user.password = params[:password]
  new_user.save
  if !(new_user.errors.empty?)
    session[:errors] = new_user.errors.full_messages
    redirect "/register"
  else
    session[:register_message] = "Registration successful!"
    redirect "/login"
  end
end
