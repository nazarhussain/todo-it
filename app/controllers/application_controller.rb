class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization :unless => :devise_controller?
  layout :set_layout

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, :alert => exception.message
  end

  def set_layout
    devise_controller? ? 'public' : 'application'
  end

  def after_resending_confirmation_instructions_path_for(resource_name)
    new_user_session_path
  end
end

