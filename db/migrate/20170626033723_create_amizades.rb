class CreateAmizades < ActiveRecord::Migration[5.1]
  def change
    create_table :amizades do |t|
      t.integer :seguidor_id
      t.integer :seguido_id

      t.timestamps
    end
    add_index :amizades, :seguidor_id
    add_index :amizades, :seguido_id
    add_index :amizades, [:seguidor_id, :seguido_id], unique: true
  end
end
