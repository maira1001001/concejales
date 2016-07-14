class Users::PasswordsController < Devise::PasswordsController
  # before_filter :configure_sign_up_params , only: [:create]
  # before_filter :configure_account_update_params, only: [:update]
  # Permitted parameters
  #before_action :configure_permitted_parameters, if: :devise_controller?

  # GET /resource/sign_up
  # def new
  #  super
  # end

  # POST /resource
  # def create
  #  super
  # end

  # GET /resource/edit
  def edit

    @user = resource
    sign_out(@user) if  @user.current_user
    set_minimum_password_length
    @user.reset_password_token = params[:reset_password_token]
    @user = find_user_by_token(params[:reset_password_token])
    if @user.nil?
      notice = 'Link inválido. Puede que ya haya modificado su contraseña' ##TODO hacer nueva vista para esto
      redirect_to new_user_session_path , notice: notice
    else
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end


  protected

  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end

  def after_update_path_for(resource)
    user_path(resource)
  end

  def find_user_by_token(token)
    User.find_by(reset_password_token: token)
  end

  def after_resetting_password_path_for(resource)
    Devise.sign_in_after_reset_password ? after_sign_in_path_for(resource) : new_session_path(resource_name)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:identity_card, :information_unit, person_attributes: [:name, :last_name, :document_type, :document_number, :record_number, :gender, :birth_date, :address, :postal_code, :city, :personal_phone, :job_phone, :origin_city, :origin_address, :institution, :career, :year, :division]) }
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   password_path(resource_name)
  # end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
    #    '/users/sign_in'
  end
end
