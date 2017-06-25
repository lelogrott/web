module IngredientesHelper
	def ingredientes_for_select
		Ingrediente.all.collect do |ingrediente|
			[ingrediente.name, ingrediente.id]
		end
	end
end
