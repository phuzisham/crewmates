class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      added_attrs = [:username, :email, :name, :home, :age, :experience, :avatar, :available, :account_type, :detail, :password, :password_confirmation, :remember_me]
      update_attrs = [:username, :email, :name, :home, :age, :experience, :avatar, :available, :account_type, :detail, :password, :password_confirmation, :current_password]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: update_attrs
    end
end
