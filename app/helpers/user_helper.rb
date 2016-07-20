
def current_user
  if session[:id]
    return User.find_by(id: session[:id])
  end
  nil
end

def logged_in?
  !!current_user
end
