class Api::V1::Customer::AuthenticationController < Api::V1::Customer::BaseController
  skip_before_action :authorize_request, except: %i(destroy)

  def create
    result = Authentication::AuthenticationService.call(params: params)
    render_json :ok, "Đăng nhập thành công", result
  end

  def destroy
    current_customer.update authentication_token: ""
    render_json :ok, "Đăng xuất thành công"
  end
end
