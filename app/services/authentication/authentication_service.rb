class Authentication::AuthenticationService < ApplicationService
  attr_reader :params

  def initialize args = {}
    @params = args[:params]
  end

  def call
    login
  end

  private

  def login
    if valid_password?
      customer.generate_token
    else
      render_json :unauthorized, "Email hoặc mật khẩu không đúng"
    end
  end

  def valid_password?
    customer.authenticate sign_in_params[:password]
  end

  def sign_in_params
    params.permit(:email, :password)
  end

  def generate_token
    authentication_token = Authentication::GenerateAuthenticationToken.generate_token
    customer.update authentication_token: authentication_token, last_login_at: Time.zone.now

    access_token = JsonWebToken.encode customer_id: customer.id, authentication_token: authentication_token, exp: exp
    {
     access_token: access_token,
     exp: exp
    }
  end

  def customer
    @customer ||= Customer.find_by! email: sign_in_params[:email]
  rescue ActiveRecord::RecordNotFound
    render_json :unauthorized, "Email hoặc mật khẩu không đúng"
  end
end
