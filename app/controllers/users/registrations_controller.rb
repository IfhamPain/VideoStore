# frozen_string_literal: true
include ApplicationHelper

class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new, :create, :cancel]
  before_action :configure_sign_up_params, only: [:create]

  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    if(is_not_admin_or_super?)
      flash[:info] = "Access Denied!"
      redirect_to root_path
      return
    end
    super
  end

  # POST /resource
  def create
    super
  end

  def edit
    @user = current_user
  end


  def update
    @user = User.find(params[:id])
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    if @user.update(user_params)
      redirect_to @user, notice: 'Update success'
    else
      render 'edit'
    end
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :gender, :role])
  # end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :address, :gender, :role, :active,:password,:password_confirmation)
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :gender, :role])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :gender, :role])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # endx

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
