JSONAPI.configure do |config|
  config.default_paginator = :offset

  config.default_page_size = 5
  config.maximum_page_size = 20
end
