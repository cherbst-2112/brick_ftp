# frozen_string_literal: true

module BrickFTP
  module RESTfulAPI
    # Create site-wide API Key
    #
    # @see https://developers.files.com/#create-site-wide-api-key Create site-wide API Key
    #
    class CreateSiteWideApiKey
      include Command
      using BrickFTP::CoreExt::Struct
      using BrickFTP::CoreExt::Hash

      # PARAMETER      | TYPE     | DESCRIPTION
      # -------------- | -------- | -----------
      # name           | string   | Required: Public name for this API key.
      # permission_set | string   | Leave blank, or set to desktop_app to restrict the key to only desktop app functions.
      # expires_at     | string   | Have the key expire at this date/time.
      Params = Struct.new(
        'CreateSiteWideApiKeyParams',
        :name,
        :permission_set,
        :expires_at,
        keyword_init: true
      )

      # Create site-wide API Key
      #
      # @param [BrickFTP::RESTfulAPI::CreateSiteWideApiKey::Params] params parameters
      # @return [BrickFTP::Types::ApiKey]
      #
      def call(params = {})
        res = client.post('/api/rest/v1/site/api_keys.json', Params.new(params.to_h).to_h.compact)

        BrickFTP::Types::ApiKey.new(res.symbolize_keys)
      end
    end
  end
end
