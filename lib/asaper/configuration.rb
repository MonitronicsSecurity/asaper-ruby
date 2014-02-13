module Asaper
  class Configuration
    attr_accessor :api_key
    attr_reader :api_url

    def api_env=(env)
      case env
      when :staging
        @api_url = "https://api.asaper-staging.com/api/v1"
      when :sandbox
        @api_url = "https://api.asaper-sandbox.com/api/v1"
      when :production
        @api_url = "https://api.asaper.com/api/v1"
      end
    end
  end
end
