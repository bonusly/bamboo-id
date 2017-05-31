# First step of OAuth 2 is getting an authorization code via an authorization grant.
# Then we use the code in a second request to get the access token.
#
# https://tools.ietf.org/html/rfc6749#section-1.3

module BambooId
  module Urls
    module BaseAuthUrl
      def to_s
        [
          base_url,
          param_strings.join('&')
        ].join('?')
      end

      private

      def param_strings
        params.map { |key, value| "#{key}=#{value}" }
      end

      def params
        base_params.merge(additional_params)
      end

      def base_params
        {
          client_id:     client_id,
          scope:         scope,
          response_type: 'code',
          state:         state_code,
          redirect_uri:  redirect_uri
        }
      end

      def additional_params
        {}
      end
    end
  end
end
