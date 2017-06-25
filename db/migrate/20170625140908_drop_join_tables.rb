class DropJoinTables < ActiveRecord::Migration[5.1]
  def change
  	drop_join_table :ingredientes, :receita
  	drop_join_table :ingredientes, :receitas
  end
end
