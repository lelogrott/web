class AddQuantidadeToReceitaIngrediente < ActiveRecord::Migration[5.1]
  def change
  	add_column :ingredientes_receitas, :quantidade, :float
  end
end
