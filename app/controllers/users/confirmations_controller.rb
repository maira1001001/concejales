class Users::ConfirmationsController < Devise::ConfirmationsController

  respond_to :html

  #redirect:  confirmation#show | confirmation#new
  def show
    #si tiene los siguientes errores: redirect confirmations#show
    #1. token usado -> confirmed: true
    #2. param[:confirmation_token] no existe
    #3. user.errors.present? -> ver q tipo de errores
    @original_token = confirmation_token
    self.resource = confirmable_user
    if resource.confirmed? || params[:confirmation_token].blank?
      render 'devise/confirmations/new'
    end
  end

  def confirm
    @original_token = params[resource_name].try(:[], :confirmation_token)
    digested_token = Devise.token_generator.digest(self, :confirmation_token, @original_token)
    ## CHANGEME original params[resource_name].try(:[], :confirmation_token)find resurce by digested_token
    self.resource = resource_class.find_by_confirmation_token! @original_token
    if resource.confirmed?
      flash[:error] = "Su cuenta ya había sido confirmada"
      render action: 'new'
    else
      resource.update(confirmation_params)
      if resource.valid?
        resource.confirm!
        resource.status = :enable
        resource.save
        sign_in_and_redirect(resource_name, confirmable_user)
      else
        respond_with resource, resource_name, @original_token, 
          location: -> { user_confirmation_path(confirmation_token: @original_token) },
          action: :show
      end
    end
  end

  private

  def confirmation_params
    params.require(resource_name).permit(:confirmation_token, :password, :password_confirmation)
  end

  def confirmation_token
    @confirmation_token ||= (params["user"] && params["user"]["confirmation_token"]) || params["confirmation_token"]
  end

  def confirmable_user
    @confirmable_user ||= User.find_or_initialize_with_error_by(:confirmation_token, confirmation_token)
  end

end

