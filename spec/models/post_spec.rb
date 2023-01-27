require_relative '../rails_helper'
RSpec.describe Post, type: :model do
  subject do
    Post.new(Title: 'men', Text: 'will', CommentsCounter: 1, LikesCounter: 0, user_id: 1)
  end
  before { subject.save }
  before(:each) do
    @post = Post.create(user_id: subject.id, Title: 'dummy post', Text: 'This is a test for the latest_posts method')
  end

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

  it 'Title should not be blank' do
    subject.Title = nil
    expect(subject).to_not be_valid
  end

  it 'Title should not be blank' do
    expect(subject.Title).to eq('men')
  end

  it 'comentscounter to be greater or equal than zero' do
    subject.CommentsCounter = nil
    expect(subject).to_not be_valid
  end
  it 'LikesCounter to be greater or equal than zero' do
    subject.LikesCounter = nil
    expect(subject).to_not be_valid
  end
  context 'should increment by one' do
    it 'increments post comments counter by 1' do
      expect(User.find(user.id).PostsCounter).to eq(1)
    end
  end
end
