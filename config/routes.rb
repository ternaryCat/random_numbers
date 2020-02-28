Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resource :random_number, only: %i[show]
    end
  end
end
