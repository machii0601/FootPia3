class Admin::UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def hide
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用をお待ちしております。"
    redirect_to root_path
  end

  def edit
  end
end
