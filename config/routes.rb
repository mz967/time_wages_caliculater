Rails.application.routes.draw do
  root 'home#top'
  namespace :api do
    namespace :v1 do
      resources :tasks
      resources :works
    end
  end
  get '*path', to: 'home#top'
end
