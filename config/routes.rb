Rails.application.routes.draw do
  resources :addresses
  resources :contacts
  root 'contacts#index'
end
