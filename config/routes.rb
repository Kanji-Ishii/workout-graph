Rails.application.routes.draw do
  get '/', to: 'home#index'
  resources :records
  resources :exercises

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
   }
   #devise_scope :user do
   #  get 'my_page' => 'users/registrations#my_page'
   #end
end
