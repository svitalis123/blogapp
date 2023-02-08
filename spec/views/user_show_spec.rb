require_relative '../rails_helper'
RSpec.describe 'index page', type: :system do
  before(:each) do
    @user = User.create(Name: 'VITS', Photo: 'https:123', Bio: 'A software developer based in Kenya', PostsCounter: 0)
    3.times do |a|
      @posts = Post.create(user_id: @user.id, Title: "#{a} Post", Text: 'hello', CommentsCounter: 0, LikesCounter: 0)
    end
  end
  context 'render user show page' do
    it 'show content in user' do
      visit user_path(@user)
      expect(page).to have_content(@user.Name)
      expect(page).to have_content('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.') # rubocop:disable Layout/LineLength
      expect(page).to have_xpath("//img[@src='#{@user.Photo}']")
      expect(page).to have_content(@user.PostsCounter)
    end
    it 'show three posts' do
      visit user_path(@user)
      expect(page).to have_css('.post', count: 3)
    end

    it 'button for user posts' do
      visit user_path(@user)
      expect(page).to have_button 'See all posts'
    end

    it 'onclick redirect to posts show' do
      visit user_path(@user)
      click_link @posts.id, match: :first
      expect(page).to have_current_path("/users/#{@user.id}/posts/#{@posts.id}")
    end

    it 'onclick redirect to posts index' do
      visit user_path(@user)
      click_button 'See all posts'
      expect(page).to have_current_path("/users/#{@user.id}/posts")
    end
  end
end
