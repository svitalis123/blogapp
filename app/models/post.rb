class Post < ApplicationRecord
  has_many :likes, foreign_key: :post_id
  has_many :comments, foreign_key: :post_id
  belongs_to :user
  validates :Title, presence: true, length: { in: 1..249 }
  validates :CommentsCounter, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :LikesCounter, presence: true, numericality: { greater_than_or_equal_to: 0 }
  after_save :update_user_counter
  def update_user_counter
    user.increment!(:PostsCounter)
  end

  def recent_commemnt
    comments.order(created_at: :desc).limit(5)
  end
end
