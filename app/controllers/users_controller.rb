class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :disable, :enable]
  before_action :set_current_user, only: [:my_profile, :update_my_profile]

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
  end

  def update_my_profile
    @user.update_my_profile(my_profile_params)
    respond_with @user, location: my_projects_path
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

  def my_profile_params
    params.require(:user).permit(:email, :name, :password, :confirm_password)
  end

end
