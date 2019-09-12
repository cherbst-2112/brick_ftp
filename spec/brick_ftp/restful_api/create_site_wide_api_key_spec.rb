# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BrickFTP::RESTfulAPI::CreateSiteWideAPIKey, type: :lib do
  describe '#call' do
    context 'given correct parameters' do
      it 'return created Site Wide API key object' do
        created_api_key = BrickFTP::Types::APIKey.new(
          id: 1,
          created_at: "2000-01-01 01:00:00 UTC",
          expires_at: "2000-01-01 01:00:00 UTC",
          key: "[key]",
          name: "My Main API Key",
          permission_set: "full",
          platform: "win32",
          user_id: 1
        )

        stub_request(:post, 'https://subdomain.files.com/api/rest/v1/site/api_keys.json')
          .with(
            basic_auth: %w[api-key x],
            headers: {
              'User-Agent' => 'BrickFTP Client/1.0 (https://github.com/koshigoe/brick_ftp)',
            },
            body: {
              name: 'API Key Name',
              permission_set: 'full',
              expires_at: '2000-01-01 01:00:00 UTC'
            }.to_json
          )
          .to_return(body: created_api_key.to_h.to_json)

        rest = BrickFTP::RESTfulAPI::Client.new('subdomain', 'api-key')
        params = BrickFTP::RESTfulAPI::CreateSiteWideAPIKey::Params.new(
          name: 'API Key Name',
          permission_set: 'full',
          expires_at: '2000-01-01 01:00:00 UTC'
        )
        command = BrickFTP::RESTfulAPI::CreateSiteWideAPIKey.new(rest)

        expect(command.call(params)).to eq created_api_key
      end
    end
  end
end
