class AddTextAboutUsuario < ActiveRecord::Migration[5.1]
  def change
  	add_column :usuarios, :sobre, :text
  end
end
