module BambooId
  class StateCode
    def initialize(subdomain)
      self.subdomain = subdomain
    end

    def to_s
      Digest::MD5.hexdigest([Configuration.client_id, subdomain].join(''))
    end

    private

    attr_accessor :subdomain
  end
end
