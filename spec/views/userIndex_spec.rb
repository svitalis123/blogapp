require_relative '../rails_helper'

RSpec.describe 'index page', type: :system do
  before(:each) do
    @user = User.create(Name: 'VITS',Photo: 'https:123', Bio: 'A software developer based in Kenya', PostsCounter: 0)
  end

  context 'should show rendered page content' do
    it 'show all content' do
      visit root_path
      expect(page).to have_content(@user.Name)
      # expect(page).to have_xpath("//img[@src=#{@user.Photo}]")
      expect(page).to have_content(@user.PostsCounter)
      expect(page).to have_xpath("//img[@src='#{@user.Photo}']")
    end
  end
end