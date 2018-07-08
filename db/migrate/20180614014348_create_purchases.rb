class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :article_id
      t.boolean :is_purchased, default: false
      t.integer :price

      t.timestamps
    end
    add_index :purchases, [:user_id, :article_id], unique: true
  end
end
