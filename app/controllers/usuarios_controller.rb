class UsuariosController < ApplicationController
	include SessionsHelper
	before_action :default_for_edit, only: [:show, :edit, :update]
	def index
		@user = Usuario.all
	end

	def show
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

	def update
		if @user.update_attributes(user_params)
			flash[:success] = "USUARIO ALTERADO COM SUCESSO!"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
	end

	private

	def user_params
		params.require(:usuario).permit(:name, :email, :login, :password, :password_confirmation)
	end

	def default_for_edit
		@user = Usuario.find(params[:id])
	end


end
