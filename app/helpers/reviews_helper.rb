module ReviewsHelper
  def review_instance_from(article)
    @review = article.reviews.find_by(user_id: current_user.id)
  end
    
end
