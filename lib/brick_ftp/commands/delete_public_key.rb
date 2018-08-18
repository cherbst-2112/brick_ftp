# frozen_string_literal: true

require 'brick_ftp/commands/restful'

module BrickFTP
  module Commands
    class DeletePublicKey
      include RESTful

      # Deletes the specified public key.
      #
      # @param [Integer] id Globally unique identifier of each public key.
      #   Each public key is given an ID automatically upon creation.
      #
      def call(id)
        client.delete("/api/rest/v1/public_keys/#{id}.json")
        true
      end
    end
  end
end
