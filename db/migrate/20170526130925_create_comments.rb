class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      
      t.string :commenter
      t.text :body
      t.references :article
      t.string :commentable_type
      t.integer :commentable_id
      t.timestamps
    
  		end
	end
end
