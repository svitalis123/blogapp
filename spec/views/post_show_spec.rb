require 'rails_helper'

RSpec.describe 'Post show page', type: :system do
  before(:each) do
    @user = User.create(Name: 'John', Photo: 'https://kiddy.com/pic/890987655', Bio: 'Hi there')
    @post = Post.create(Title: 'Hello from Mars',
                        Text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', CommentsCounter: 0, LikesCounter: 0, user_id: @user)
    @comment = Comment.create(user_id: @user, post_id: @post, Text: 'This is the first comment...')

    visit user_post_path(user, post)
  end

  context 'When visiting the post show page' do
    it "should display the post's title" do
      expect(page).to have_content('Hello from Mars')
    end

    it "should display the author's name" do
      expect(page).to have_content(@user.Name)
    end

    it 'should display the number of comments' do
      expect(page).to have_content('Comments: 1')
    end
    it 'should display the number of likes' do
      expect(page).to have_content('Likes: 0')
    end
    it "should display the post's body" do
      expect(page).to have_content(@post.Text)
    end

    it 'should display the comments pusblished' do
      @post.comments.each do |comment|
        expect(page).to have_content(comment.Text)
        expect(page).to have_content(comment.user.Name)
      end
    end
  end
end
