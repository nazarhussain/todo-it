class Api::BaseController < ApplicationController
  before_filter :skip_trackable
  before_filter :load_user_from_token
  skip_before_filter :verify_authenticity_token # CSFR Token
  respond_to :json

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render_error('Record can not found')
  end

  rescue_from Exception do |exception|
    if Rails.env == 'development'
      render_error("Something went wrong. #{exception.message}", 500)
    else
      render_error("Something went wrong.", 500)
    end
  end

  def render_error(error, status=401)
    render :json => {:msg => error}.to_json, :status => status
  end

  def render_object(object)
    render :json => object.to_json
  end

  def skip_trackable
    request.env['devise.skip_trackable'] = true
  end

  def load_user_from_token
    token = request.headers['auth_token']
    if token.present? and User.find_by_authentication_token(token).present?
      sign_in(:user, User.find_by_authentication_token(token))
    else
      render_error 'Please provide auth_token.'
    end
  end
end
