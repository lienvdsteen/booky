Rails.application.config.middleware.use OmniAuth::Builder do
  provider :openbibid, "4896c09f783031297b60d96bee4fff34", "8b8e4d4c90cf518c6b7d2bd29229f8ee"
end
