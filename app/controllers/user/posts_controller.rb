class User::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @comments = @post.post_comments
  end

  def new
    @post = Post.new
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      @post.save_tags(params[:post][:tag])
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
       @post.save_tags(params[:post][:tag])
      flash[:notice] = "投稿できました"
      redirect_to posts_path
    else
      @posts = Post.all
      render :new
    end
  end

  def destroy
    Post.find(params[:id]).destroy()
    redirect_to root_path
  end


  private
  def post_params
    params.require(:post).permit(:title, :post_content)
  end
end
