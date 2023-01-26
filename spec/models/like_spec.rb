require_relative '../rails_helper'
RSpec.describe Like, type: :model do
  subject do
    user = User.new(Name: 'peter', Photo: 'https://123.com', Bio: 'hello bio', PostsCounter: 1)
    post = Post.create(Title: 'men', Text: 'will', CommentsCounter: 1, LikesCounter: 1, users_id: user)
    Like.create(user_id: user, posts_id: post)
  end

  it 'should return 1' do
    expect(subject).to respond_to(:update_like_counter)
  end
end
