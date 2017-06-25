class DropTableReceita < ActiveRecord::Migration[5.1]
  def change
  	drop_table :receita
  end
end
