module SessionsHelper

  # Logs the given user in
  def login(user)
    # session creates a temporary cookie on the users browser and
    # stores the encrypted user id. Session expires on browser close.
    session[:user_id] = user.id
  end

  # Grabs the current user using user_id in session
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  # Test if a user is logged in
  def logged_in?
    !current_user.nil?
  end
end
