# frozen_string_literal: true

require 'erb'

module BrickFTP
  module RESTfulAPI
    # Copy a file or folder
    #
    # @see https://developers.files.com/#copy-a-file-or-folder Copy a file or folder
    #
    class CopyFolder
      include Command
      using BrickFTP::CoreExt::Struct
      using BrickFTP::CoreExt::Hash

      # PARAMETER        | TYPE   | DESCRIPTION
      # ---------------- | ------ | -----------
      # path             | string | Path
      # copy-destination | string | Full path of the file or folder. Maximum of 550 characters.
      # structure        | any    | Optionally, provide the parameter `structure` and set it to any value to only copy the folder structure without copying any files.
      Params = Struct.new(
        'CopyFolderParams',
        :path,
        :'copy-destination',
        :structure,
        keyword_init: true
      )

      # Copies a file or folder to the destination provided in the
      # `copy-destination` parameter in the request body.
      # Note that a copy will fail if the destination already exists.
      #
      # Optionally, provide the parameter `structure` and set it to any value
      # to only copy the folder structure without copying any files.
      #
      # @param [BrickFTP::RESTfulAPI::CopyFolder::Params] params parameters
      #
      def call(params)
        params = Params.new(params.to_h).to_h.compact
        path = params.delete(:path)
        client.post("/api/rest/v1/files/#{ERB::Util.url_encode(path)}", params)
        true
      end
    end
  end
end
