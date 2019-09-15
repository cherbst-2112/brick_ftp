# frozen_string_literal: true

require 'erb'

module BrickFTP
  module RESTfulAPI
    # List history for specific file
    #
    # @see https://developers.files.com/#list-history-for-specific-file List history for specific file
    #
    class RetrieveFileHistory
      include Command
      using BrickFTP::CoreExt::Struct
      using BrickFTP::CoreExt::Hash

      # PARAMETER | TYPE     | DESCRIPTION
      # --------- | -------- | -----------
      # path      | string   | History path.
      # page      | integer  | Current page.
      # per_page  | integer  | History actions per page.
      # start_at  | string   | Leave blank or set to a date/time to filter earlier entries.
      # end_at    | string   | Leave blank or set to a date/time to filter later entries.
      # display   | string   | Display format. Leave blank or set to `full` or `parent`.
      Params = Struct.new(
        'RetrieveFileHistoryParams',
        :path,
        :page,
        :per_page,
        :start_at,
        :end_at,
        :display,
        keyword_init: true
      )

      # List history for specific file
      #
      # @param [BrickFTP::RESTfulAPI::RetrieveFileHistory::Params] params parameters
      # @return [Array<BrickFTP::Types::History>]
      #
      def call(params = {})
        params = Params.new(params.to_h).to_h.compact
        %i[start_at end_at].each do |key|
          params[key] = params[key].utc.iso8601 if params[key].is_a?(Time)
        end

        endpoint = "/api/rest/v1/history/files/#{ERB::Util.url_encode(params.delete(:path))}"
        query = params.sort.map { |k, v| "#{k}=#{ERB::Util.url_encode(v.to_s)}" }.join('&')
        endpoint += "?#{query}" unless query.empty?
        res = client.get(endpoint)

        res.map { |i| BrickFTP::Types::History.new(i.symbolize_keys) }
      end
    end
  end
end
