# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
    @user = User.new(icon_name: "default_user.jpg")
    # logger.debug("========================= params[:user][:user_type] = #{params[:user][:user_type]}")
    # @user = User.last
    # @user.user_type = params[:user][:user_type]
    # @user.save
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    logger.debug("========================= params[:user][:user_type] = #{params[:user][:last_name]}")
    super
    
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute, :user_type])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute, :last_name, :first_name, :profile, :gender, :salon_name, :salon_url, :image, :age, :icon_name, :photo])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
     edit_user_registration_path
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    edit_user_registration_path
  end
end
