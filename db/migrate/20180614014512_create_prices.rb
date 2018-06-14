class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.integer :article_id
      t.integer :max_price
      t.integer :min_price
      t.integer :rate

      t.timestamps
    end
  end
end
