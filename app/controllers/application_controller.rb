class ApplicationController < ActionController::Base
 protect_from_forgery with: :exception
 
  before_action :configure_permitted_parameters, if: :devise_controller?
 # before_action :authenticate_user!, except: [:home, :about, :contact]
   before_action :assign_admin_if_true

  def assign_admin_if_true
    if current_user &&current_user.username=="ADMIN"
     current_user.admin=true
     current_user.save
    end
  end
  protected
 
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me,:admin]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
