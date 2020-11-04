# frozen_string_literal: true
include ApplicationHelper
class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # GET /resource/sign_in
  before_action :disable_login, only: [:new]
  def new
    @session_resource = resource_class.new(sign_in_params)
    self.resource = @session_resource
  end

  # POST /resource/sign_in
  def create
    #sign_in(resource_name, resource)
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
