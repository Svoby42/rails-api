class ApplicationController < ActionController::API
  include AuthenticateRequest
  before_action :current_user

  def not_found
    render json: { error: 'not_found' }
  end
end
