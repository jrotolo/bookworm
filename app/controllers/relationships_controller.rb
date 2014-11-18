class RelationshipsController < ApplicationController
 
  # Creates a following/follwer relationship
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user
  end
  
  # Destroys a following/follwer relationship
  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user
  end
end
