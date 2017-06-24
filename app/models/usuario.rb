class Usuario < ApplicationRecord

	has_secure_password

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	validates :name, presence: true
	validates :login, presence: true
	validates :password, presence: true, length: {minimum: 4}

	
end
