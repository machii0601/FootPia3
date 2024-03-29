class User::FollowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) # ユーザー情報取得
    @follows = @user.followed(@user) # フォローしているユーザー一覧取得
    @followers = @user.follower(@user) # フォローされているユーザー一覧取得
  end

  def create
    # フォローレコードが1件もない場合は、レコードを作る
    Follow.find_or_create_by(user_id: params[:follow_id], follow_id: current_user.id)
    redirect_to request.referer
  end

  def destroy
    # フォローレコードを探し、フォローレコードを削除する
    #   TODO : 勝手に他のユーザーのフォローを外されないようにparams[:id]で対象のユーザーIDを受け取る
    Follow.find_by(user_id: params[:id], follow_id: current_user.id).delete
    redirect_to request.referer
  end
end
