# frozen_string_literal: true

require 'uri'

module BrickFTP
  module RESTfulAPI
    class UploadFile
      include Command

      CHUNK_SIZE_RANGE = 5_242_880..5_368_709_120

      # At this point, you are to send a PUT request to the returned upload_uri with the file data,
      # along with the headers and parameters provided to you from BrickFTP.
      #
      # The upload_uri link is signed by BrickFTP and must be used within 15 minutes.
      # You will receive an HTTP 200 response with no body upon successful upload.
      #
      # Should you wish to upload the file in multiple parts (required if the file size exceeds 5 GB)
      # you will need to request an additional upload URL for the next part.
      #
      # @param [String] path Full path of the file or folder. Maximum of 550 characters.
      # @param [IO] data
      # @param [Integer, nil] chunk_size the chunk sizes are required to be between 5 MB and 5 GB
      # @return [BrickFTP::Types::File] File object
      #
      def call(path, data, chunk_size: nil)
        chunk_size = adjust_chunk_size(data, chunk_size)
        validate_range_of_chunk_size!(chunk_size)

        upload = StartUpload.new(client).call(path)
        chunk_io = BrickFTP::Utils::ChunkIO.new(data, chunk_size: chunk_size)

        rest = data.size
        chunk_io.each do |chunk|
          rest -= client.upload_file(upload.http_method, upload.upload_uri, chunk)
          break if !chunk_size || rest <= 0

          upload = ContinueUpload.new(client).call(path, ref: upload.ref, part: upload.part_number + 1)
        end
        CompleteUpload.new(client).call(path, ref: upload.ref)
      end

      private

      # To single uploading if chunk_size less than equals data size.
      def adjust_chunk_size(data, chunk_size)
        chunk_size && chunk_size >= data.size ? nil : chunk_size
      end

      def validate_range_of_chunk_size!(chunk_size)
        raise ArgumentError, 'chunk_size must be between 5MB and 5GB' if chunk_size && !CHUNK_SIZE_RANGE.cover?(chunk_size)
      end
    end
  end
end
