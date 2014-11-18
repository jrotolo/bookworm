class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  # Action: users#new 
  # Route: users/new or /signup (new_user or signup)
  # View: users/new.html.erb
  # Description: This method passes a new user object to the view, 
  # => the signup form.
  def new
  	@user = User.new
  end

  # Action: users#show 
  # Route: /users/:id (user)
  # View: users/show.html.erb
  # Description: This method routes information to the show view.
  # => the user profile page based on :id
  def show
    @user = User.find(params[:id])
    # debugger <- place this line anywhere in code to bring up debugger console in rails server pretty cool! See gem byebug.
  end

  # Action: users#create 
  # Route: /users
  # Description: This method saves the user to the database after a 
  # => successful sign up.
  def create
  	@user = User.new(user_params)
  	if @user.save
        login @user
  		flash[:success] = "Welcome to BookWorm!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, 
  			:password_confirmation)
  	end
end
