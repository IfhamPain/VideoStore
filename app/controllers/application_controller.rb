class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do
    flash[:error] = 'Access denied!'
    redirect_to root_url
  end

  def current_ability
    if superuser_signed_in?
      @current_ability ||= Ability.new(current_superuser)
    elsif user_signed_in?
      @current_ability ||= Ability.new(current_user)
    else
      #If the user is a guest
      @current_ability ||= Ability.new(User.new)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :gender, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :gender, :role])
  end
end
