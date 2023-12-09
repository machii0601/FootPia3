class User::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def update
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿できました"
      redirect_to posts_path
    else
      @posts = Post.all
      render :new
    end
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :post_content)
  end
end
