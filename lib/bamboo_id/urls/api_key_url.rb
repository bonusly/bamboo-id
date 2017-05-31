module BambooId
  module Urls
    class ApiKeyUrl
      def initialize(subdomain:, id_token:)
        self.subdomain = subdomain
        self.id_token  = id_token
      end

      def to_s
        "https://api.bamboohr.com/api/gateway.php/#{subdomain}/v1/oidcLogin"
      end

      def params
        {
          id_token: id_token,
          applicationKey: Configuration.application_key
        }
      end

      private

      attr_accessor :subdomain, :id_token
    end
  end
end
