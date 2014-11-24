class TopicsController < ApplicationController
  def new
    @topic = Topic.new
    @post = Post.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      @topic = Topic.new(:name => params[:topic][:name], 
                         :last_poster_id => current_user.id,
                         :last_post_at => Time.now,
                         :bookclub_id => params[:topic][:bookclub_id])
      redirect_to "/bookclubs/#{@topic.bookclub_id}"
    else
      render :action => 'new'
    end
  end

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def edit
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :last_poster_id, :last_post_at,
                                  :bookclub_id)
  end

end
