class User::PostCommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

  def new
  end

  def index
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  private

  def  post_comment_params
    params.require(:post_comment).permit(:post_comment)
  end
end
