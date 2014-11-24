class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(:content => params[:post][:content], 
                     :topic_id => params[:post][:topic_id],
                     :user_id => current_user.id)
    if @post.save
      flash[:notice] = "Created a post."
      redirect_to "/topics/#{@post.topic_id}"
    else
      render :action => 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end
end
