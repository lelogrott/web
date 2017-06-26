class AddPrivatePublicToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :usuarios, :privado, :boolean
  end
end
