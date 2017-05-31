module BambooId
  module Urls
    module BambooUrl

      private

      def client_id
        Configuration.client_id
      end

      def base_url
        raise NotImplementedError
      end

      def params
        raise NotImplementedError
      end
    end
  end
end
