class PostsController < ApplicationController
  def index; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.find(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post, notice: 'You post was created successfully'
    else
      render new
    end
  end

  private

  def post_params
    params.require(:post).permit(:date, :rationale)
  end
end
