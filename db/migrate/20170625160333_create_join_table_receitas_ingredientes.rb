class CreateJoinTableReceitasIngredientes < ActiveRecord::Migration[5.1]
  def change
  	create_join_table :receitas, :ingredientes do |t|
  		t.index :receita_id
  		t.index :ingrediente_id
  	end
  end
end
