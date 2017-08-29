Rails.application.configure do
  config.time_zone = 'Asia/Shanghai'

  #I18n.available_locales = [:en, :'zh-CN']
  config.i18n.available_locales = [:en, :'zh-CN']
  config.i18n.default_locale = :en

  config.i18n.fallbacks = [[:en, :'zh-CN'], ['zh-HK', :'zh-CN'], ['zh-TW', :'zh-CN'], ['zh-YUE', :'zh-CN'], ['zh-CN', :en]]
end
