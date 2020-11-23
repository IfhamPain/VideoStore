# frozen_string_literal: true

class Superusers::RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new, :create, :cancel]
  before_action :disable_superuser_signup, only: [:create]
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    @superuser = Superuser.find(1)
    if params[:superuser][:password].blank?
      params[:superuser].delete(:password)
      params[:superuser].delete(:password_confirmation)
    end
    if @superuser.update(superuser_params)
      redirect_to root_url, notice: 'Update success'
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

  def disable_superuser_signup
    if current_superuser.nil?
      redirect_to root_path
      flash[:danger] = "access denied"
    end
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :gender])
  end

  # Setting up allowed parameters
  def superuser_params
    params.require(:superuser).permit(:first_name, :last_name, :email, :address, :gender, :active,:password,:password_confirmation)
  end
end
