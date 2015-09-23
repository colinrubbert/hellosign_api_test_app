require 'hello_sign'
HelloSign.configure do |config|
  config.api_key = ENV["hellosign_api_key"]
end
