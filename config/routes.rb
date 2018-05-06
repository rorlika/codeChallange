Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      jsonapi_resources :pages, only: %i[create index] do
        # jsonapi_related_resources :source
      end
    end
  end
end
