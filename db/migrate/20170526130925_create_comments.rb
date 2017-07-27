class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      
      t.string :commenter
      t.text :body
      t.references :article
      t.integer :user_id
      t.timestamps
    
  		end
	end
end
