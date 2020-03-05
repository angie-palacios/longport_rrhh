class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  # local setting in URL to translate the content with I18n.
  before_action :set_locale
  # skip_before_action :verify_authenticity_token, :if => :json_request?

  protect_from_forgery with: :exception

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sing_up) {|u| u.permit(:email, :password, :password_confirmation, :business, :status, :documentation, :name, :date_initiated, :analytical_account, :position, :sex, :date_birth, :date_finality, :salary, :variable_salary, :constitutive_compensation, :constitutive_not_compensation, :contract, :address, :neighborhood, :phone, :marital_status, :profession, :eps, :afp, :photo, :rol_id)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:email, :password, :password_confirmation, :business, :status, :documentation, :name, :date_initiated, :analytical_account, :position, :sex, :date_birth, :date_finality, :salary, :variable_salary, :constitutive_compensation, :constitutive_not_compensation, :contract, :address, :neighborhood, :phone, :marital_status, :profession, :eps, :afp, :photo, :rol_id)}
  end

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale] = I18n.locale
  end
end
