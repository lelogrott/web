class Receita < ApplicationRecord
  belongs_to :usuario

  validates :title, :modo_de_preparo, presence: true
  validates :usuario, presence: true
end
