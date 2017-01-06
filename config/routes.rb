Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  root to: 'static#index'
  resources :users, only: [:new, :create]
	get '/home', to: 'videos#index'
	resources :videos do
		collection do
			get 'search'
		end
	end
	resources :categories, only: [:show]
	resources :sessions, only: [:new,:create]
	get '/logout', to: 'sessions#destroy'
end