module ArticlesHelper
  
  def display_in_yen(price)
    price.to_s + " 円"
  end
end
