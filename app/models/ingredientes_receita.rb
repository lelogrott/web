class IngredientesReceita < ApplicationRecord
	validates :quantidade, presence: true
end
