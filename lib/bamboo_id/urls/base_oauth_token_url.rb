module BambooId
  module Urls
    module BaseOauthTokenUrl
      def to_s
        base_url
      end

      def params
        {
          client_id:     client_id,
          client_secret: client_secret,
          grant_type:    grant_type,
          redirect_uri:  redirect_uri,
          scope:         scope
        }.tap do |parameters|
          parameters[refresh? ? :refresh_token : :code] = temporary_code
        end.select do |_key, value|
          value != nil && value != ''
        end
      end

      private

      attr_accessor :temporary_code, :grant_type

      def scope
        nil
      end

      def refresh?
        grant_type == 'refresh_token'
      end
    end
  end
end
