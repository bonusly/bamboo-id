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
        @response ||= OpenStruct.new(self.class.post(url.to_s, body: url.params, headers: headers))
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
