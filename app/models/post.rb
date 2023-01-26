class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :user
  after_save :update_user_counter

  def update_user_counter
    user.increment!(:PostsCounter)
  end

  def recent_commemnt
    comments.order(created_at: :desc).limit(5)
  end
end
