class User::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @word = params[:word]
    if @range == "Post"
      @posts = Post.looks(params[:search], @word)
    else
      @post_comments = PostComment.looks(params[:search], @word)
    end
  end

  private
  def search_params
    params.require(:search).permit(:title, :post_content)
  end
end
