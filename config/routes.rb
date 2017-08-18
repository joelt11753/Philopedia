Rails.application.routes.draw do

	resources :wikis

	resources :charges, only: [:new, :create, :destroy]

	get '/charges', to: 'charges#destroy', as: :downgrade

	devise_for :users
	root 'welcome#index'
end
