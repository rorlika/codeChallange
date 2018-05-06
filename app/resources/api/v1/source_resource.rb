module Api
  module V1
    class SourceResource < JSONAPI::Resource
      attributes :h1, :h2, :h3, :links
    end
  end
end
