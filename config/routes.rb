Rails.application.routes.draw do
  root 'home#index'
  get '/swipe', to: 'swipe#index'
  get '/matches', to: 'matches#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'isbn/:isbn' => 'isbn#show'
end
