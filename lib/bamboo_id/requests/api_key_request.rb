require_relative 'basic_request_handling.rb'

module BambooId
  module Requests
    class ApiKeyRequest
      include BasicRequestHandling

      def initialize(subdomain:, id_token:)
        self.subdomain = subdomain
        self.id_token  = id_token
      end

      def successful?
        response.success
      end

      def key
        response.key
      end

      private

      attr_accessor :subdomain, :id_token

      def url
        Urls::ApiKeyUrl.new(subdomain: subdomain, id_token: id_token)
      end

      def headers
        {
          'Content-Type' => 'application/x-www-form-urlencoded',
          'Accept'       => 'application/json'
        }
      end
    end
  end
end
