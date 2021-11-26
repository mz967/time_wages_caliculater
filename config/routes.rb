Rails.application.routes.draw do
  root 'home#top'
  get 'home/introduction'
  get '*path', to: 'home#top'
end
