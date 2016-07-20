class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :disable, :enable]
  before_action :set_current_user, only: [:my_profile, :update_profile_collaborator, 
                                          :update_profile_councilor, :change_password, :update_password]

  respond_to  :html

  def index
    @q = User.admin_user_list(current_user).page(params[:page]).ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
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
    respond_with @user, location: users_path
  end

  def disable
    @user.disable
    respond_with @user, location: users_path
  end

  def new_collaborator
    @user = User.new
  end

  def my_profile
    render 'profile_collaborator' if @user.collaborator?
    render 'profile_councilor'    if @user.councilor?
  end

  def update_profile_councilor
    @user.update(profile_councilor_params)
    respond_with @user, location: my_projects_path, action:  :profile_councilor
  end

  def update_profile_collaborator
    @user.update(profile_collaborator_params)
    respond_with @user, location: my_projects_path, action:  :profile_collaborator
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

  def profile_collaborator_params
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
