Rails.application.routes.draw do
  root 'home#index'
  get 'isbn/:isbn' => 'isbn#show'
end
