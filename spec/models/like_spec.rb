require_relative '../rails_helper'
RSpec.describe Like, type: :model do
  user = User.create(
    Name: 'VITS',
    Photo: 'https:123',
    Bio: 'A software developer based in Kenya',
    PostsCounter: 0
  )

  post = Post.create(
    Title: 'my title',
    Text: 'Hello World!',
    CommentsCounter: 1,
    LikesCounter: 0,
    user_id: user.id
  )

  Like.create(
    user_id: user.id,
    post_id: post.id
  )

  context '#increment_post_likes_counter' do
    it 'increments post likes counter by 1' do
      expect(Post.find(post.id).LikesCounter).to eq(0)
    end
  end
end
