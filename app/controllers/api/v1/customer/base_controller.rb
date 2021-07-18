class Api::V1::Customer::BaseController < ApplicationController
  include SerializerHelper
  include ExceptionHandler

  attr_reader :current_customer

  before_action :authorize_request

  private

  def authorize_request
    if decoded_auth_token[:customer_id] == authenticated_customer.id
      @current_customer = authenticated_customer
    else
      render_json :unauthorized, "unauthorize_request"
    end
  end

  def authenticated_customer
    Customer.find_by_authentication_token!(decoded_auth_token[:authentication_token])
  rescue ActiveRecord::RecordNotFound
    render_json :unauthorized, "invalid token"
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode http_auth_header
  rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
    render_json :unauthorized, "unauthorize_request"
  end

  def http_auth_header
    return request.headers["Authorization"].split.last if request.headers["Authorization"].present?

    raise ExceptionHandler::InvalidToken
  end

  def render_json status, message = "", data = nil
    render json: {status: status, message: message, data: data}.compact, status: status
  end
end
