require "bundler/setup"
require "bamboo_id"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

BambooId::Configuration.redirect_url = 'http://localhost:3000/company/integrations/bamboo/authorization_callback'
