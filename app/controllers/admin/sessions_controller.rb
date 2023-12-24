# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :reject_user, only: [:create]
  before_action :admin_status, only: [:create]
  def after_sign_in_path_for(resource)
    admin_users_path
  end

  protected

  # def reject_user
  #   @user = Admin.find_by(email: params[:admin][:email].downcase)
  #   if @user
  #     if (@user.valid_password?(params[:admin][:password]))
  #       flash[:error] = "退会済みです。"
  #       redirect_to new_user_session_path
  #     end
  #   else
  #     flash[:error] = "必須項目を入力してください。"
  #   end
  # end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

private
  def admin_status
    admin = Admin.find_by(email: params[:admin][:email])
    return if admin.nil?
      return unless admin.valid_password?(params[:admin][:password])
      #unless admin.is_active == true
        #flash[:alert] = "すでに退会済みです"
        #redirect_to new_admin_registration_path
      #end
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
