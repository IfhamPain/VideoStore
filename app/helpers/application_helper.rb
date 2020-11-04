module ApplicationHelper

  #Check if user has admin privileges
  def is_not_admin_or_super?
    if(!(superuser_signed_in? || (user_signed_in? && current_user.admin?)))
      return true
    end
    return false
  end

  def disable_login
    if !current_user.nil? || !current_superuser.nil?
      redirect_to root_path
      flash[:danger] = "access denied"
    end
  end

end
