get "/profile" do
  if !logged_in?
    halt(403, "You shall not pass")
  else
    erb :"user/profile"
  end
end
