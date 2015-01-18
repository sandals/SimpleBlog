Rails.application.routes.draw do
	root "pages#index", via: :get

	scope "/dashboard", module: 'admin', as: "admin" do
		get "/", to: "dashboard#index", as: "root"

		resources :articles, only: [:new, :create, :edit, :update]
	end

	resources :articles, only: [:show] do
		resources :comments, only: [:create]
	end
end
