class CreateFeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :feeds do |t|
      t.integer :article_id
      t.integer :user_id
      t.boolean :like, default: false
      t.boolean :bad, default: false

      t.timestamps
    end
    add_index :feeds, [:user_id, :article_id], unique: true
  end
end

