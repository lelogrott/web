class IngredientesController < ApplicationController
	def index
	end

	def show
	end

	def new
	end

	def create
		@ingrediente = Ingrediente.new(ingrediente_params)
		if @ingrediente.save
			redirect_to url_for(controller: "receitas", action: "new", usuario_id: params[:usuario_id]), notice: "ingrediente cadastrado"
		else
			flash[:notice] = "erro ao cadastrar ingrediente. #{@ingrediente.errors.full_messages}"
		end
	end

	private

	def ingrediente_params
		params.require(:ingrediente).permit(:name)
	end
	
end
