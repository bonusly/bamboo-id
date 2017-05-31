require 'spec_helper'
require 'bamboo_id'

module BambooId
  module Urls
    describe OauthTokenUrl do
      let(:url) do
        described_class.new(
          temporary_code: 'qwerty',
          subdomain:      'bonuslysandbox',
          grant_type:     'authorization_code'
        )
      end

      before do
        allow(Configuration).to receive(:client_id)     { '123' }
        allow(Configuration).to receive(:client_secret) { 'abc' }
      end

      describe '#to_s' do
        it 'returns the expected base url' do
          expect(url.to_s).to eq 'https://bonuslysandbox.bamboohr.com/token.php?request=token'
        end
      end

      describe '#params' do
        it 'returns the appropriate params for initial auth' do
          expect(url.params).to eq({
            client_id: '123',
            client_secret: 'abc',
            code: 'qwerty',
            grant_type: 'authorization_code',
            scope: 'openid email',
            redirect_uri: 'http://localhost:3000/company/integrations/bamboo/authorization_callback'
          })
        end
      end
    end
  end
end
