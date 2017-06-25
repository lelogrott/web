class CreateReceitas < ActiveRecord::Migration[5.1]
  def change
    create_table :receitas do |t|
      t.string :title
      t.text :modo_de_preparo
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
