class Admin::CommentsController < ApplicationController
  before_action :authenticate_!
  def index
    @post = Post.find(params[:post_id])
    @post_comments = @post.post_comments
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    redirect_to admin_post_comments_path
  end
end
