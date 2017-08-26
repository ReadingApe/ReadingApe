Rails.application.configure do
  config.time_zone = 'Asia/Shanghai'

  #I18n.available_locales = [:en, :'zh-CN']
  config.i18n.available_locales = [:en, :'zh-CN']
  config.i18n.default_locale = :'zh-CN'

  config.i18n.fallbacks = [:en, :'zh-CN']
end
