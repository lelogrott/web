class Receita < ApplicationRecord
  belongs_to :usuario

  # has_many :ingredientes_receitas
  # has_many :ingredientes, through: :ingredientes_receitas
  has_and_belongs_to_many :ingredientes

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ""
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title, :modo_de_preparo, presence: true
  validates :usuario, presence: true
end
