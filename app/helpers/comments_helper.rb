module CommentsHelper
  def any_reply?(comment)
    !Comment.find_by(reply_id: comment.id).nil?
  end
end
