Rails.application.routes.draw do
  root 'home#top'
  namespace :api do
    namespace :v1 do
      resources :tasks
      resources :works
      resources :users do
        collection do
          get 'me'
        end
      end
      resources :user_sessions
    end
  end
  get '*path', to: 'home#top'
end
