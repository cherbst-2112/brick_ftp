# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BrickFTP::RESTfulAPI::UpdateGroup, type: :lib do
  describe '#call' do
    context 'given correct parameters' do
      it 'return updated Group object' do
        updated_group = BrickFTP::Types::Group.new(
          id: 1,
          admin_ids: [],
          name: 'owners',
          notes: '',
          user_ids: [],
          usernames: []
        )

        stub_request(:put, 'https://subdomain.files.com/api/rest/v1/groups/1234.json')
          .with(
            basic_auth: %w[api-key x],
            headers: {
              'User-Agent' => 'BrickFTP Client/1.0 (https://github.com/koshigoe/brick_ftp)',
            },
            body: { name: 'owners' }.to_json
          )
          .to_return(body: updated_group.to_h.to_json)

        rest = BrickFTP::RESTfulAPI::Client.new('subdomain', 'api-key')
        params = BrickFTP::RESTfulAPI::UpdateGroup::Params.new(id: 1234, name: 'owners')
        command = BrickFTP::RESTfulAPI::UpdateGroup.new(rest)

        expect(command.call(params)).to eq updated_group
      end
    end
  end
end
