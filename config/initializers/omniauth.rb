OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '644937869274382', 'ec5bc04c52bf00e7889d71a5a7b404db', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
