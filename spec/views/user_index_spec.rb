require_relative '../rails_helper'

RSpec.describe 'index page', type: :system do
  before(:each) do
    @user = User.create(Name: 'VITS', Photo: 'https:123', Bio: 'A software developer based in Kenya', PostsCounter: 0)
    3.times do |a|
      @user.posts.create(user_id: @user.id, Title: "#{a} Post")
    end
  end

  context 'RENDER USER INDEX' do
    it 'show all content' do
      visit root_path
      expect(page).to have_content(@user.Name)
      # expect(page).to have_xpath("//img[@src=#{@user.Photo}]")
      expect(page).to have_content(@user.PostsCounter)
      expect(page).to have_xpath("//img[@src='#{@user.Photo}']")
    end
    it 'redirect to show' do
      visit root_path
      click_link @user.Name, match: :first
      expect(page).to have_current_path(root_path(@user))
    end
  end
end
