class CreateReceita < ActiveRecord::Migration[5.1]
  def change
    create_table :receita do |t|

      t.timestamps
    end
  end
end
