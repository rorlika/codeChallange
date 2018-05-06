module Api
  module V1
    class PageResource < JSONAPI::Resource
      attributes :url, :sources
      paginator :offset

      after_create :store_content

      def store_content
        Source.create(h1: content['h1'], h2: content['h2'], h3: content['h3'], links: content['a'], page: @model )
      end

      def content
        @content ||= ScrapyService.new(@model.url).extract_content
      end

      def sources
        @model.source.as_json.except('id', 'page_id', 'updated_at', 'created_at')
      end
    end
  end
end
