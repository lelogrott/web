class Ingrediente < ApplicationRecord
	has_many :ingredientes_receita
	has_many :recipes, through: :ingredientes_receita
end
