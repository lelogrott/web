Rails.application.routes.draw do

  get 'sessions/new'

	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy'

	resources :usuarios do
		member do
			get :seguindo, :seguidores, :feed, :receitas, :descobrir, :seguir, :deixar_de_seguir, :view
		end
	end

	resources :receitas do
		member do
			get :excluir
		end
	end

	resources :ingredientes
	#match '/usuario/create' => 'usuario#create', :as => :create_usuario_path, :via => :post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
