module BambooId
  class ApiKeyFetcher
    attr_reader :error

    def initialize(code:, integration:)
      self.code        = code
      self.integration = integration
      self.error       = nil
    end

    def fetch
      unless access_token_request.successful?
        self.error = "Could not get access token: #{access_token_request.error}"
        return false
      end

      unless api_key_request.successful?
        self.error = "Could not get API key."
        return false
      end

      integration.set(api_key: api_key_request.key)
    end


    private

    attr_accessor :code, :integration
    attr_writer :error

    def access_token_request
      @access_token_request ||= Requests::AccessTokenRequest.new(
        temporary_code: code,
        subdomain: subdomain
      )
    end

    def api_key_request
      @api_key_request ||= Requests::ApiKeyRequest.new(
        id_token: access_token_request.id_token,
        subdomain: subdomain
      )
    end

    def subdomain
      integration.subdomain
    end
  end
end
