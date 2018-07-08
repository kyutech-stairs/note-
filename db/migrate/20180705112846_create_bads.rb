class CreateBads < ActiveRecord::Migration[5.1]
  def change
    create_table :bads do |t|
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
    add_index :bads, [:user_id, :article_id], unique: true
  end
end
