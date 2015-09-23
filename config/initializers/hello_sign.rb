require 'hello_sign'
HelloSign.configure do |config|
  config.api_key = ENV["hellosign_api_key"]
  config.client_id = ENV["hellosign_client_id"]
end
