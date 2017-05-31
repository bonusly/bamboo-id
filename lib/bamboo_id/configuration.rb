module BambooId
  class Configuration
    @@redirect_url = nil

    def self.redirect_url
      @@redirect_url || raise('No redirect_url set')
    end

    def self.redirect_url=(url)
      @@redirect_url = url
    end

    def self.application_key
      ENV['BAMBOO_APPLICATION_KEY']
    end

    def self.client_id
      ENV['BAMBOO_CLIENT_ID']
    end

    def self.client_secret
      ENV['BAMBOO_CLIENT_SECRET']
    end
  end
end
