class SessionsController < ApplicationController

  # Route : /login
  # Views : sessions/new.html.erb
  # Renders the login page
  def new
  end

  # Authenticates and signs the user in if success
  # else user is redirected back to log in page
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # Called when a user logouts.
  # Destroys the current sesssion.
  def destroy
    logout
    redirect_to root_url
  end
end
