class UsersController < ApplicationController
  load_and_authorize_resource
  include ApplicationHelper

  def index
    if is_not_admin_or_super?
      redirect_to root_url
      flash[:notice] = 'Access Denied!'
    end
    # User Search using Scopes
    search_users
    @users = @users.order(:first_name).page(params[:page])
    #Export users to csv
    export_csv
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :'users/sessions/new' }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
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

  def show
    @user = User.find_by_id(params[:id])
    $user_viewed_id = @user.id
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  def export_csv
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end

  private

  # Setting up allowed parameters
  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :address, :gender, :role, :active,:password,:password_confirmation)
  end

  def filtering_params(params)
    params.slice(:fname_search, :lname_search, :email_search, :role_search, :gender_search)
  end

  def search_users
    @users = User.filter(params.slice(:fname, :lname, :email, :role, :gender))
  end

end
