class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
    # debugger <- place this line anywhere in code to bring up debugger console in rails server pretty cool! See gem byebug.
  end
end
