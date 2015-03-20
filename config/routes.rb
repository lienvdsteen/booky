Rails.application.routes.draw do
  get 'isbn/:isbn' => 'isbn#show'
end
