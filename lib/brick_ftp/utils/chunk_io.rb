module BrickFTP
  module Utils
    class ChunkIO
      include Enumerable

      attr_reader :io, :chunk_size

      # Wrap IO object.
      #
      # @param [IO] io an IO object.
      # @param [Integer] chunk_size Size of chunk.
      #
      def initialize(io, chunk_size: nil)
        @io = io
        @chunk_size = chunk_size
      end

      # Iterate with chunked IO object.
      #
      # @yield [chunk] Give a chunk IO object to block.
      # @yieldparam [StringIO] chunk a chunked IO object.
      #
      def each(&block)
        return enum_for(__method__) unless block

        if chunk_size
          each_chunk(&block)
        else
          whole(&block)
        end
      end

      private

      def whole
        yield io
      end

      def each_chunk
        offset = 0
        loop do
          chunk = StringIO.new
          copied = IO.copy_stream(io, chunk, chunk_size, offset)
          break if copied.zero?

          offset += copied
          chunk.rewind

          yield chunk
        end
      end
    end
  end
end
