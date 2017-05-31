require_relative 'basic_request_handling.rb'

module BambooId
  module Requests
    module BaseAccessTokenRequest
      def self.included(base)
        base.send(:include, BasicRequestHandling)
      end

      def access_token
        response.access_token
      end

      def refresh_token
        response.refresh_token
      end

      def successful?
        error.nil?
      end

      def error
        response.error
      end

      private

      attr_accessor :temporary_code, :grant_type
    end
  end
end
