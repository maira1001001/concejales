class UserParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:email, :roles, person: [:name, :last_name, :district])
  end
end
