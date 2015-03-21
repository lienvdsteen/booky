require Rails.root.join('lib','omniauth','strategies','openbibid')

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :openbibid
end
