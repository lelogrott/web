class Receita < ApplicationRecord
  belongs_to :usuario

  # has_many :ingredientes_receitas
  # has_many :ingredientes, through: :ingredientes_receitas
  has_and_belongs_to_many :ingredientes

  validates :title, :modo_de_preparo, presence: true
  validates :usuario, presence: true
end
