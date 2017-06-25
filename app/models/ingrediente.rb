class Ingrediente < ApplicationRecord
	# has_many :ingredientes_receitas
	# has_many :receitas, through: :ingredientes_receitas
	has_and_belongs_to_many :receitas

	validates :name, presence: true
end
