class ReceitasController < ApplicationController
	include IngredientesHelper

	before_action :default_for_edit, only: [:show, :edit, :update]
	def index
		@receita = Receita.all
	end

	def show
	end

	def new
		@receita = Receita.new
		@user = Usuario.find(params[:usuario_id])
	end

	def create
		@receita = Receita.new(receita_params)
		@receita.usuario = Usuario.find(params[:usuario_id])
		unless @receita.valid? then 
			redirect_to new_receita_path(@receita, usuario_id: @receita.usuario.id), notice: @receita.errors.full_messages.join( "; ")
		else		
			@receita.save!
			params[:receita][:ingredientes].each do |ingrediente|
				@receita.ingredientes << Ingrediente.find(ingrediente[:id].to_i)
				@receita.save!
				IngredientesReceita.find_by(receita_id: @receita.id, ingrediente_id: ingrediente[:id].to_i).update(quantidade: ingrediente[:quantidade].to_f)
			end
			if @receita.save!
				flash[:success] = "RECEITA CADASTRADA"
				redirect_to @receita, notice: "A receita foi criada"
			else
				render 'new'
			end
		end
	end

	def edit
	end

	def update
		if @receita.update_attributes(receita_params)
			flash[:success] = "RECEITA ALTERADA COM SUCESSO!"
			redirect_to @receita
		else
			render 'edit'
		end
	end

	def excluir
		receita = Receita.find(params[:id])
		user = receita.usuario
		receita.destroy
		redirect_to user
	end

	private

	def receita_params
		params.require(:receita).permit(:title, :modo_de_preparo, :usuario_id, :image, :ingredientes)
	end

	def default_for_edit
		@receita = Receita.find(params[:id])
	end
end
