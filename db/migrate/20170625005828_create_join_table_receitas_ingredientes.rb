class CreateJoinTableReceitasIngredientes < ActiveRecord::Migration[5.1]
  def change
    create_join_table :receitas, :ingredientes do |t|
       t.index [:receita_id, :ingrediente_id]
       t.index [:ingrediente_id, :receita_id]
    end
  end
end
