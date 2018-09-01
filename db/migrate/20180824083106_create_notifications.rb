class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :notice_id
      t.integer :noticer_id
      t.integer :article_id
      t.string :message
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
