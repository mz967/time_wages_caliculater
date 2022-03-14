Rails.application.routes.draw do
  root 'home#top'
  namespace :api do
    namespace :v1 do
      resources :tasks do
        resources :works, only: [:index, :create, :update, :destroy] do
          # collection do
          #   get 'daily_data'
          #   get 'monthly_data'
          # end
        end
        
      end
      # resources :works
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
