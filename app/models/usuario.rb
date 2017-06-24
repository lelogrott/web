class Usuario < ApplicationRecord

	has_secure_password

	validates :name, presence: true
	validates :login, presence: true
	validates :password, presence: true, length: {minimum: 4}

	
end
