class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  afetr_save :update_comment_counter

  def update_comment_counter
    post.update(CommentsCounter: count)
  end
end
