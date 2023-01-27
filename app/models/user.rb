class User < ApplicationRecord
  has_many :comments, foreign_key: :user_id
  has_many :likes, foreign_key: :user_id
  has_many :posts, foreign_key: :user_id
  validates :Name, presence: true, length: { in: 1..255 }
  validates :PostsCounter, presence: true, numericality: { greater_than_or_equal_to: 0 }
  def recent_three_posts
    posts.order(created_at: :desc).limit(3)
  end
end
