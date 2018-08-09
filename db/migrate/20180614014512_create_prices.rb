class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.integer :article_id
      t.integer :max, default: 0
      t.integer :min, default: 0
      t.integer :rate, default: 0
      t.integer :now_price, default: 0

      t.timestamps
    end
  end
end
