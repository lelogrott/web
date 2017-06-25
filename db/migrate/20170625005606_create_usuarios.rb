class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
    	t.string :name
    	t.string :login
    	t.string :email
    	t.string :password
    	t.string :password_digest
    	t.timestamps
    end
    add_attachment :usuarios, :avatar
  end
end
