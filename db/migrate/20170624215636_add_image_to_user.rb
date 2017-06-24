class AddImageToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :usuarios, :image, :string
  end
end
