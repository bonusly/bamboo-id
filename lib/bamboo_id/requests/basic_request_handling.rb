require 'httparty'

module BambooId
  module Requests
    module BasicRequestHandling
      def self.included(base)
        base.send :include, HTTParty
        base.send :format, :json
      end

      private

      def response
        @response ||= OpenStruct.new(http_response)
      rescue NoMethodError, JSON::ParserError
        OpenStruct.new(error: 'Invalid response from Bamboo. Please try again.')
      end

      def http_response
        @http_response ||= self.class.post(url.to_s, body: url.params, headers: headers)
      end

      def headers
        {}
      end

      def url
        raise NotImplementedError, 'Please implement #url'
      end
    end
  end
end
