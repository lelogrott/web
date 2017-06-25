module ReceitasHelper
	include ActionView::Helpers::TagHelper

	def tabela_de_ingredientes(receita)
		ingredientes = receita.ingredientes
		content_tag :table do
			ingredientes.each do |ingrediente|
				concat(content_tag(:tr,
					content_tag(:td, IngredientesReceita.find_by(receita_id: receita.id, ingrediente_id: ingrediente.id).quantidade) +
					content_tag(:td, ingrediente.name)
				)).to_s.html_safe
			end
		end
	end
end
