class Usuario < ApplicationRecord

	has_secure_password

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "150x150>", small: "32x32>" }, default_url: "/images/:style/download.png"

	has_many :receitas

	has_many :active_amizades, class_name: "Amizade", foreign_key: "seguidor_id", dependent: :destroy
	has_many :passive_amizades, class_name: "Amizade", foreign_key: "seguido_id", dependent: :destroy
	has_many :seguindo, through: :active_amizades, source: :seguido	
	has_many :seguidores, through: :passive_amizades, source: :seguidor

 	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	validates :name, presence: true
	validates :login, presence: true
	#validates :password, presence: true, length: {minimum: 4}
	validates :privado, inclusion: { in: [true, false] }

	def seguir(usuario)
		seguindo << usuario
	end

	def deixar_de_seguir(usuario)
		seguindo.delete(usuario)
	end

	def seguindo?(usuario)
		seguindo.include?(usuario)
	end
	
end
