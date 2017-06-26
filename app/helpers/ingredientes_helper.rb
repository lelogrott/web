module IngredientesHelper

	def ingredientes_for_select
		list = Ingrediente.all.collect do |ingrediente|
			[ingrediente.name, ingrediente.id]
		end
		list << ["Outro", '']
	end
end
