class CreateIngredientesReceita < ActiveRecord::Migration[5.1]
   def change
    create_table :ingredientes_receita do |t|
      t.integer :ingrediente_id
      t.integer :receita_id

      t.timestamps
    end
  end
end
