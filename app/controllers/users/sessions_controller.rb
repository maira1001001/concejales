class Users::SessionsController < Devise::SessionsController
  # before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # Overwriting the sign_out redirect path method
  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource)
    if current_user.personal_data_completed?
      edit_person_path(resource.person)
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end


  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
