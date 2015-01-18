module PostsHelper

  def get_upvote(post)
    current_user.upvotes.find_by(post: post)
  end

  def upvoted?(post)
    !get_upvote(post).nil?
  end

  def get_downvote(post)
    current_user.downvotes.find_by(post: post)
  end

  def downvoted?(post)
    !get_downvote(post).nil?
  end

  def favored?(post_id)
    !get_favorite(post_id).nil?
  end

  def get_favorite(post_id)
    current_user.favorites.find_by(post_id: post_id)
  end

  def relative_time(created_at)
    time_ago_in_words(created_at)
  end
end
