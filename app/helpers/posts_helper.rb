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

  def relative_time(created_at)
    time_ago_in_words(created_at)
  end
end
