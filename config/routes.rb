Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/introduction'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
