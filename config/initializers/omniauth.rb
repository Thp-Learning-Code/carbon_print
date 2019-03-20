OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '644937869274382', '530295220f6092407afa975d00f58379', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
