class CreateReceitas < ActiveRecord::Migration[5.1]
  def change
    create_table :receitas do |t|
    	t.belongs_to :usuario, index: true
    	t.string :title
    	t.text :modo_de_preparo
    	t.timestamps
    end
  end
end
