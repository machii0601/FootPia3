class User::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  def confirm
  end

  def withdrawal
    @user = current_user
    @user.update(is_active: false)
    reset_session
    flash[:alert] = "退会しました"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :profile_image, :soccer_futsal_experience, :position, :bio)
  end
end
