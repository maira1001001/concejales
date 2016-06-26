require "application_responder"

class ApplicationController < ActionController::Base


  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # User authentication
#  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    stored_location_for(resource)
    users_path
  end


  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

end
