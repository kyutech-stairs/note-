class RenameColumnToPrices < ActiveRecord::Migration[5.1]
  def change
    rename_column :prices, :min_price, :min
    rename_column :prices, :max_price, :max
  end
end
