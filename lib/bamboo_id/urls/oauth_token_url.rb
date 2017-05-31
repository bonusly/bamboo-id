module BambooId
  module Urls
    class OauthTokenUrl
      include BambooUrl
      include BaseOauthTokenUrl

      def initialize(temporary_code:, subdomain:, grant_type: 'authorization_code')
        self.temporary_code = temporary_code
        self.subdomain      = subdomain
        self.grant_type     = grant_type
      end

      private

      attr_accessor :subdomain

      def base_url
        "https://#{subdomain}.bamboohr.com/token.php?request=token"
      end

      def client_secret
        Configuration.client_secret
      end

      def redirect_uri
        Configuration.redirect_url
      end

      def scope
        'openid email'
      end
    end
  end
end
