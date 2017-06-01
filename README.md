# BambooId

Makes connecting to BambooHR with OpenID easier.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bamboo-id', require: 'bamboo_id'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bamboo-id

## Usage

### Configuration

`Bamboo::Configuration.redirect_url` must be set.

The following environment variables are also required:
- `BAMBOO_APPLICATION_KEY`
- `BAMBOO_CLIENT_ID`
- `BAMBOO_CLIENT_SECRET`

### Authorizing

To get the initial authorization URL, use `BambooId::Urls::AuthUrl.new(subdomain).to_s`

In the callback controller, you can use `BambooId::ApiKeyFetcher` to get an API key
using the code passed to you like so:

```ruby
::BambooId::ApiKeyFetcher.new(
  code: params[:code],
  integration: current_company.user_management_integration
).fetch
```

This will either return an api key or `false` with an `error` attribute set.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bonusly/bamboo-id. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

