Rails.application.routes.draw do
  resources :categories
	root "properties#index"
	
	devise_for :users

	resources :properties, :categories
end
