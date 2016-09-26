Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '167575363348301', '14000a1047cc6af94a4c52866365890f'
end