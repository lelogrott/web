class CreateReceita < ActiveRecord::Migration[5.1]
  def change
    create_table :receita do |t|
      t.string :title
      t.text :modo_de_preparo
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
