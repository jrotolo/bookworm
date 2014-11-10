module SessionsHelper

  # Logs the given user in
  def log_in(user)
    # session creates a temporary cookie on the users browser and
    # stores the encrypted user id. Session expires on browser close.
    session[:user_id] = user.id
  end
end
