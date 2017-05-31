require_relative 'base_access_token_request.rb'

module BambooId
  module Requests
    class AccessTokenRequest
      include BaseAccessTokenRequest

      def initialize(temporary_code:, subdomain:, grant_type: 'authorization_code')
        self.temporary_code = temporary_code
        self.subdomain      = subdomain
        self.grant_type     = grant_type
      end

      def id_token
        response.id_token
      end

      private

      attr_accessor :subdomain

      def url
        @url ||= Urls::OauthTokenUrl.new(
          temporary_code: temporary_code,
          subdomain:      subdomain,
          grant_type:     grant_type
        )
      end
    end
  end
end
