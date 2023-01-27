require_relative '../rails_helper'
RSpec.describe Comment, type: :model do
  subject { Comment.new(Text: 'follow the spirit') }
  it 'expect to respond to the method update_comment_counter' do
    expect(subject).to respond_to(:update_comment_counter)
  end
  describe do
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

    Comment.create(
      user_id: user.id,
      post_id: post.id,
      Text: 'HELELL'
    )
    context 'should increment by one' do
      it 'increments post comments counter by 1' do
        expect(Post.find(post.id).CommentsCounter).to eq(1)
      end
    end
  end
end
