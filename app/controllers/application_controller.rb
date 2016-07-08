require "application_responder"
require "gravatarify"

class ApplicationController < ActionController::Base


  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # User authentication
  before_action :authenticate_user!

end
