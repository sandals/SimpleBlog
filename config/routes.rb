Rails.application.routes.draw do
	root "pages#index", via: :get

	resources :articles, only: [:show] do
		resources :comments, only: [:create]
	end
end
