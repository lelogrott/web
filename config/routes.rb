Rails.application.routes.draw do

  get 'sessions/new'

	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy'
	resources :usuarios do
		member do
			get :seguindo, :seguidores, :feed
		end
	end
	resources :receitas
	resources :ingredientes
	#match '/usuario/create' => 'usuario#create', :as => :create_usuario_path, :via => :post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
