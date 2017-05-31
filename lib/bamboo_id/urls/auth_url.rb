require_relative 'bamboo_url.rb'
require_relative 'base_auth_url.rb'

# URL for getting initial authorization from Bamboo.
#
# If user authorizes access to their Bamboo account, we get back
# an authorization code code which is then fed to OauthTokenUrl for getting
# the OAuth access token.
#
module BambooId
  module Urls
    class AuthUrl
      include BambooUrl
      include BaseAuthUrl

      def initialize(subdomain)
        self.subdomain = subdomain
      end

      private

      attr_accessor :subdomain

      def additional_params
        {
          request: 'authorize'
        }
      end

      def base_url
        "https://#{subdomain}.bamboohr.com/authorize.php"
      end

      def param_strings
        params.map { |key, value| "#{key}=#{value}" }
      end

      def scope
        'openid email'
      end

      def redirect_uri
        CGI.escape(Configuration.redirect_url)
      end

      def state_code
        StateCode.new(subdomain).to_s
      end
    end
  end
end
