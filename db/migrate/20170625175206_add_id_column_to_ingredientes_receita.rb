class AddIdColumnToIngredientesReceita < ActiveRecord::Migration[5.1]
  def change
  	add_column :ingredientes_receitas, :id, :primary_key
  end
end
