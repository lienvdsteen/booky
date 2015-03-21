Rails.application.routes.draw do
  root 'home#index'
  get '/app', to: 'app#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'isbn/:isbn' => 'isbn#show'
end
