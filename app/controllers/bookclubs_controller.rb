class BookclubsController < ApplicationController
  def new
    @user = User.find(params[:user])
    @bookclub = Bookclub.new
  end

  def index
    @bookclubs = Bookclub.all
    @title = "Bookclub index"
  end

  def show
    @bookclub = Bookclub.find(params[:id])
  end

  def create
    @bookclub = Bookclub.new(bookclub_params)
    if @bookclub.save
      @bookclub = Bookclub.new(:name => params[:bookclub][:name], 
                               :description => params[:bookclub][:description], 
                               :user_id =>params[:bookclub][:user_id])
      redirect_to "/users/#{@bookclub.user_id}/bookclubs"
    else
      render :action => 'new'
    end
  end

  def destroy
    @bookclub = Bookclub.find(params[:id])
    @bookclub.destroy
    redirect_to current_user
  end

  private

  def bookclub_params
    params.require(:bookclub).permit(:name, :description, :user_id)
  end
end
