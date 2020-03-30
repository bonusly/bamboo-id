require 'spec_helper'
require 'webmock/rspec'

module BambooId
  module Requests
    describe AccessTokenRequest do
      before do
        stub_request(:post, 'https://bonuslysandbox.bamboohr.com/token.php?request=token').
          to_return(body: response_body)
      end

      let(:temporary_code) { 'qwerty' }
      let(:request)        { described_class.new(temporary_code: temporary_code, subdomain: 'bonuslysandbox') }

      context 'when successful' do
        let(:response_body) do
          {
            "access_token": "XXX",
            "token_type": "Bearer",
            "expires_in": 3600,
            "scope": nil
          }.to_json
        end

        describe '#successful?' do
          it 'returns true' do
            expect(request).to be_successful
          end
        end

        describe '#access_token' do
          it 'returns the access token from the response' do
            expect(request.access_token).to eq 'XXX'
          end
        end
      end

      context 'when failed' do
        let(:response_body) do
          {
            error: 'access_denied'
          }.to_json
        end

        describe '#successful?' do
          it 'returns false' do
            expect(request).to_not be_successful
          end
        end

        describe '#access_token' do
          it 'returns nil' do
            expect(request.access_token).to be nil
          end
        end
      end

      context 'when bamboo blows up and returns an error page instead of a hash' do
        let(:response_body) do
          'oh no i blew up and this is a string'
        end

        describe '#successful?' do
          it 'returns false' do
            expect(request).to_not be_successful
          end
        end

        describe '#access_token' do
          it 'returns nil' do
            expect(request.access_token).to be nil
          end
        end
      end
    end
  end
end
