module ArticlesHelper
  
  def display_in_yen(price)
    if price == 0
      "無料"
    else
      price.to_s + "円"
    end
  end
end
