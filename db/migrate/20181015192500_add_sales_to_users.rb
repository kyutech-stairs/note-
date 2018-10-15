class AddSalesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sales, :integer, default: 0
    add_column :users, :sales_summary, :integer, default: 0
  end
end
