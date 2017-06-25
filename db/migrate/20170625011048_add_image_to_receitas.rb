class AddImageToReceitas < ActiveRecord::Migration[5.1]
  def up
    add_attachment :receitas, :image
  end

  def down
    remove_attachment :receitas, :image
  end
end
