# frozen_string_literal: true

module BrickFTP
  module RESTfulAPI
    # Deactivate SSL Certificate
    #
    # @see https://developers.files.com/#deactivate-ssl-certificate Deactivate SSL Certificate
    #
    class DeactivateCertificate
      include Command
      using BrickFTP::CoreExt::Struct
      using BrickFTP::CoreExt::Hash

      # PARAMETER | TYPE    | DESCRIPTION
      # --------- | ------- | -----------
      # id        | integer | Required: SSL Certificate ID.
      Params = Struct.new(
        'DeactivateCertificateParams',
        :id,
        keyword_init: true
      )

      # Deactivate SSL Certificate
      #
      # @param [BrickFTP::RESTfulAPI::DeactivateCertificate::Params] params parameters
      # @return [Boolean]
      #
      def call(params = {})
        params = Params.new(params.to_h).to_h.compact
        client.post("/api/rest/v1/certificates/#{params.delete(:id)}/deactivate.json")
        true
      end
    end
  end
end
