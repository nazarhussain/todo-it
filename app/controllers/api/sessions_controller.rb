class Api::SessionsController < DeviseController
  before_filter :authenticate_user!, :except => [:create, :destroy]
  before_filter :ensure_params_exist
  respond_to :json

  def create
    resource = User.find_for_database_authentication(:email => params[:email])
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:password])
      sign_in(:user, resource)
      render :json => {:success => true, :auth_token => resource.authentication_token, :email => resource.email}
      return
    end
    invalid_login_attempt
  end

  def destroy
    sign_out(resource_name)
  end

  def new
    if request.format == :json
      render_error("Please provide a valid token")
    end
  end

  protected
  def ensure_params_exist
    return unless params[:email].blank?
    render :json => {:success => false, :message => "missing user_login parameter"}, :status => 422
  end

  def invalid_login_attempt
    warden.custom_failure!
    render :json => {:success => false, :message => "Error with your login or password"}, :status => 401
  end
end
