require 'rails_helper'

RSpec.describe 'Post index page', type: :system do
  before do
    driven_by(:rack_test)

    user = User.create(Name: 'John', Photo: 'https://kiddy.com/pic/890987655', Bio: 'Hi there', PostsCounter: 0)
    Post.create(Title: 'Hello from Mars',
                Text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', CommentsCounter: 0, LikesCounter: 0, user_id: user.id) # rubocop:disable Layout/LineLength
    @post = Post.create(Title: 'Hello from Earth', Text: 'The printing and typesetting industry.',
                        CommentsCounter: 0, LikesCounter: 0, user_id: user.id)
    @comment = Comment.create(user_id: user.id, post_id: @post.id, Text: 'Hello')

    visit user_posts_path(user.id)
  end

  context 'When visiting the post index page' do
    it "should load the user's name" do
      expect(page).to have_content('John')
    end

    it 'should load the number of posts by the user' do
      expect(page).to have_content('Number of posts: 2')
    end

    it "should load the post's title" do
      expect(page).to have_content('Hello from Earth')
      expect(page).to have_content('Hello from Mars')
    end

    it 'should show posts bodies' do
      expect(page).to have_content(@post.Text)
    end

    it 'should show posts last comments' do
      expect(page).to have_content(@comment.Text)
    end

    it 'should show pagination' do
      expect(page).to have_content('Pagination')
    end
  end
end
