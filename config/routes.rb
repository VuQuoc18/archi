Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :customer do
        post "login", to: "authentication#create", as: "login"
        post "logout", to: "authentication#destroy", as: "logout"
        post "reset-password", to: "authentication#reset_password"
        get "forgot_password", to: "authentication#forgot_password_type"
      end
    end
  end
end
