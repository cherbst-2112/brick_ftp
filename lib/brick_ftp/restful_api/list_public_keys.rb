# frozen_string_literal: true

module BrickFTP
  module RESTfulAPI
    # List user's SSH public keys
    #
    # @see https://developers.files.com/#list-user-39-s-ssh-public-keys List user's SSH public keys
    #
    class ListPublicKeys
      include Command
      using BrickFTP::CoreExt::Struct
      using BrickFTP::CoreExt::Hash

      # PARAMETER | TYPE    | DESCRIPTION
      # --------- | ------- | -----------
      # id        | integer | Required: User ID.
      Params = Struct.new(
        'ListPublicKeysParams',
        :id,
        keyword_init: true
      )

      # List user's SSH public keys
      #
      # @param [BrickFTP::RESTfulAPI::ListPublicKeys::Params] params parameters
      # @return [Array<BrickFTP::Types::PublicKey>]
      #
      def call(params = {})
        params = Params.new(params.to_h).to_h.compact
        res = client.get("/api/rest/v1/users/#{params.delete(:id)}/public_keys.json")

        res.map { |i| BrickFTP::Types::PublicKey.new(i.symbolize_keys) }
      end
    end
  end
end
