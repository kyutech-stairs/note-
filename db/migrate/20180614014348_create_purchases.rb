class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :article_id
      t.boolean :is_purchased
      t.integer :price

      t.timestamps
    end
  end
end
