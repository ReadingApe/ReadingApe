class ApplicationController < ActionController::Base
  before_action :set_locale

  def self.default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    if t = extract_locale_from_accept_language_header and I18n.available_locales.include?(t.to_sym)
      I18n.default_locale = t.to_sym
    end

    if params[:locale] and I18n.available_locales.include?(params[:locale].to_s.strip.to_sym)
      l = params[:locale].to_s.strip.to_sym
    else
      l = I18n.default_locale
    end
    I18n.locale = l
  end
  protect_from_forgery with: :exception

private
  def extract_locale_from_accept_language_header
    return request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first if request.env['HTTP_ACCEPT_LANGUAGE'].present?
  end
end
