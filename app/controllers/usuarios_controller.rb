class UsuariosController < ApplicationController
	include SessionsHelper
	before_action :default_for_edit, only: [:show, :edit, :update, :feed, :receitas, :descobrir]
	def index
		@user = Usuario.all
	end

	def show
		@receitas = @user.receitas.order('created_at DESC').limit(4)		
	end

	def view
		@user = Usuario.find(params[:user_id])
		@receitas = @user.receitas || []
		if current_user.present? then
			unless (!@user.privado || @user.seguidores.include?(current_user)) then
				redirect_to current_user, notice: "O usuário #{@user.name} tem perfil privado."
			end
		else
			if (@user.privado) then
				redirect_to login_path, notice: "O usuário #{@user.name} tem perfil privado."
			end
		end
		render 'show'	
	end

	def receitas
		@receitas = @user.receitas.order('created_at DESC')
	end

	def new
		@user = Usuario.new
	end

	def create
		@user = Usuario.new(user_params)
		if @user.save
			log_in @user
			flash[:success] = "BEM VINDO A RECEITAS"
			redirect_to @user, notice: "O usuario foi criado"
		else
			render 'new'
		end
	end

	def edit
	end

	def descobrir
		@lista_receitas = []
		Receita.all.each do |receita|
			if ((!receita.usuario.privado || @user.seguindo.include?(receita.usuario)) && receita.usuario != current_user) then
				@lista_receitas << receita
			end
		end
		
	end

	def update
		if @user.update_attributes(user_params)
			flash[:success] = "USUARIO ALTERADO COM SUCESSO!"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def feed
		@amigos = @user.seguindo
		@receitas_collection = {}
		@amigos.each do |amigo|
			@receitas_collection[amigo.id.to_s.to_sym] = Receita.where(usuario_id: amigo.id)
		end
	end

	def destroy
	end

	def seguindo
	end

	def seguir
		amigo = Usuario.find(params[:user_id])
		user = Usuario.find(current_user.id)
		user.seguir(amigo)
		redirect_to amigo
	end

	def deixar_de_seguir
		amigo = Usuario.find(params[:user_id])
		current_user.deixar_de_seguir(amigo)
		redirect_to amigo
	end

	def seguidores
	end

	private

	def user_params
		params.require(:usuario).permit(:name, :email, :login, :password, :password_confirmation, :avatar, :sobre, :privado)
	end

	def default_for_edit
		@user = Usuario.find(params[:id])
	end


end
