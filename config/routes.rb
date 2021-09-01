Rails.application.routes.draw do
  get '/', to: 'home#index'
  devise_for :users
  resources :records
  resources :exercises, only: %i[index create]
end
