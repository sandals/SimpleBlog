Rails.application.routes.draw do
	root "pages#index", via: :get

	scope "/dashboard", module: 'admin', as: "admin" do
		get "/", to: "dashboard#index", as: "root"

		resources :articles, only: [:new, :create, :edit, :update, :destroy]
	end

	resources :articles, only: [:index, :show] do
		resources :comments, only: [:create]
	end
end
