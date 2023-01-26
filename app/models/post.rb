class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :user
  after_save :update_user_counter

  validates :Title, presence: true, length: { in: 1..249 }
  validates :CommentsCounter, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :LikesCounter, presence: true, numericality: { greater_than_or_equal_to: 0 }
  def update_user_counter
    user.increment!(:PostsCounter)
  end

  def recent_commemnt
    comments.order(created_at: :desc).limit(5)
  end
end
