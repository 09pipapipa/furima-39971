class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :birthday, :first_name, :last_name, :first_name_kana, :last_name_kana])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username,password|
      username == 'pipapipa' && password == 'hiro98081623'
    end
  end
end
