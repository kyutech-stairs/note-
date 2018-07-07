class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :article_id
      t.boolean :is_purchased, default: false
      t.integer :price_id

      t.timestamps
    end
  end
end
