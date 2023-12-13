# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create]
   before_action :user_status, only: [:create]
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end


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

  private
  def user_status
    user = User.find_by(email: params[:user][:email])
    return if user.nil?
      return unless user.valid_password?(params[:user][:password])
      unless user.is_active == true
        flash[:alert] = "すでに退会済みです"
        redirect_to new_user_registration_path
      end
  end



  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
