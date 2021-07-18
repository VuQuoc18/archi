module ExceptionHandler
  include SerializerHelper
  extend ActiveSupport::Concern

  class InvalidToken < StandardError; end
  included do
    rescue_from ExceptionHandler::InvalidToken, with: :rescue_invalid_token
  end

  private

  def rescue_invalid_token
    render_json :unauthorized, "invalid token"
  end
end
