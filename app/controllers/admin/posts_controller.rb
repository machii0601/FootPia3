class Admin::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comments = @post.post_comments
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to admin_post_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :post_content)
  end
end
