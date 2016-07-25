class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy, :disable, :enable]
  before_action :set_current_user, only: [:my_profile, :update_profile_councilor, 
                                          :update_profile, :change_password, :update_password]

  respond_to  :html

  def index
    @users = User.admin_user_list(current_user).page(page_params)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.save
    respond_with @user, location: :users
  end

  def update
    @user.update(user_params)
    respond_with @user
  end

  def destroy
    @user.destroy
    respond_with @user
  end

  def enable
    @user.enable ##TODO si es councilor, dejarle habilitar sus colaboradores (no cualquier usuario)
    respond_with @user, location: (@user.admin? ? users_path : my_collaborators_path)
  end

  def disable
    @user.disable
    respond_with @user, location: (@user.admin? ? users_path : my_collaborators_path)
  end

  def my_profile
    if @user.councilor? 
      render 'profile_councilor'
    elsif @user.collaborator?
      render 'profile_collaborator'
    else
      render 'profile'
    end
  end

  def update_profile_councilor
    @user.update(profile_councilor_params)
    respond_with @user, location: my_projects_path, action:  :profile_councilor
  end

  def update_profile
    @user.update(profile_params)
    if @user.collaborator?
      respond_with @user, location: my_projects_path, action:  :profile
    else
      respond_with @user, location: projects_path, action:  :profile
    end
  end

  def change_password
  end

  def update_password
    @user.update_password(password_params[:password], password_params[:password_confirmation])
    respond_with @user, location: my_projects_path, action: :change_password
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :role, :name, :last_name)
  end

  def profile_params
    params.require(:user).permit(:email, :name, :last_name)
  end

  def profile_councilor_params
    params.require(:user).permit(:email, :name, :last_name, 
      participation_attributes: [:district_id, :political_party_id, :start_date, :end_date, :in_function])
  end

  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end

end
