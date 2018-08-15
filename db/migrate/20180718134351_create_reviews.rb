class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.text :title
      t.integer :star
      t.integer :user_id
      t.integer :article_id
      
      t.timestamps
    end
    add_index :reviews, [:user_id, :article_id], unique: true
  end
end
