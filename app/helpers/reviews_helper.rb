module ReviewsHelper
  def review_instance_from(article)
    @review = article.reviews.find_by(user_id: current_user.id)
  end

  def avg_reviews(reviews)
    (reviews.map(&:star).inject(0.0){ |r, i| r+=i } / reviews.size).round(2)
  end

  def add_bad_class(review)
    if review.star<=2
      "bad_review"
    else
      ""
    end
  end
end
