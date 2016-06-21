class UserParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:email, :roles, person_attributes: [:name, :last_name])
  end
end
