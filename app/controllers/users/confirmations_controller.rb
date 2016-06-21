class Users::ConfirmationsController < Devise::ConfirmationsController

  respond_to :html

  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    @original_token = 
      if params[:confirmation_token].present?
        params[:confirmation_token]
      elsif params[resouce_name].try(:[], :confirmation_token).present?
        params[resource_name][:confirmation_toke]
      end

    self.resource = resource_class.find_by_confirmation_token Devise.token_generator.digest(self, :confirmation_token, @original_token)

    render action: 'show' if resource.nil? or resource.confirmed?
  end

  def confirm
    @original_token = params[resource_name].try(:[], :confirmation_token)
    digested_token = Devise.token_generator.digest(self, :confirmation_token, @original_token)
    self.resource = resource_class.find_by_confirmation_token! digested_token
    resource.assign_attributes(permitted_params) unless params[resource_name].nil?

    if resource.valid? && resource.password_match?
      self.resource.confirm!
      set_flash_message :notice, :confirmed
      sign_in_and_redirect resource_name, resource
    else
      render :action => 'show'
    end
  end

  private
  def permitted_params
    params.require(resource_name).permit(:confirmation_token, :password, :password_confirmation)
  end
end

# protected

# The path used after resending confirmation instructions.
# def after_resending_confirmation_instructions_path_for(resource_name)
#   super(resource_name)
# end

# The path used after confirmation.
# def after_confirmation_path_for(resource_name, resource)
#   super(resource_name, resource)
# end
end
