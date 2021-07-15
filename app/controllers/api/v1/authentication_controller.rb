class Api::V1::AuthenticationController < Api::V1::BaseController
  skip_before_action :authorize_request, except: %i(destroy)

  def create
    result = Authentication::AuthenticationService.call(username: sign_in_params[:username],
    password: sign_in_params[:password])
    render_json :ok, "Đăng nhập thành công"
  end

  def destroy
    current_employee.update authentication_token: ""
    render_json :ok, "Đăng xuất thành công"
  end

  private

  def sign_in_params
    params.permit(:username, :password)
  end
end
