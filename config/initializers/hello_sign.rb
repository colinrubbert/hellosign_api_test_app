require 'hello_sign'
HelloSign.configure do |config|
  config.api_key = '16576c6fbccc59596078a630bd21fb65ecc5138325c7beff7d8404b4f1c4de76'
  # You can use email_address and password instead of api_key. But api_key is recommended
  # If api_key, email_address and password are all present, api_key will be used
  # config.email_address = 'email_address'
  # config.password = 'password'
end
