class User::FavoritesController < ApplicationController
  before_action :post_find, only: [:create, :destroy]
  before_action :authenticate_user!

  def create
    current_user.favorites.new(post_id: @post.id).save
    render "event"
  end

  def destroy
    current_user.favorites.find_by(post_id: @post.id).destroy
    render "event"
  end

  private

  def post_find
    @post = Post.find(params[:post_id])
  end
end
