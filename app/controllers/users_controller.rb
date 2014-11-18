class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  # This method passes a new user object to the view, 
  # the signup form.
  def new
  	@user = User.new
  end

  # Description: This method routes information to the show view.
  # the user profile page based on :id
  def show
    @user = User.find(params[:id])
  end

  # This method saves the user to the database after a 
  # successful sign up.
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
  
  # Sets the following relationship
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end
  
  # Sets the followers relationship
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
