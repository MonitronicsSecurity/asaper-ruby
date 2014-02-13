require 'asaper'

API_KEY = "123456"
API_ENV = :staging

Asaper.configure do |config|
  config.api_key = API_KEY
  config.api_env = API_ENV
end
