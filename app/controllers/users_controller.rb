class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :disable, :enable]

  respond_to  :html

  def index
    @q = User.all_without_current(current_user).page(params[:page]).ransack(params[:q])
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
    @user.enable
    respond_with @user, location: users_path
  end

  def disable
    @user.disable
    respond_with @user, location: users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :roles, person_attributes: [:name, :last_name, :current_district_id])
  end

end
