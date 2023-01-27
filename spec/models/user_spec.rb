require_relative '../rails_helper'
RSpec.describe User, type: :model do
  subject do
    User.new(Name: 'Lilly', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Poland.')
  end
  before { subject.save }
  it 'name should not be blank' do
    subject.Name = nil
    expect(subject).to_not be_valid
  end
  it 'name should not be blank' do
    expect(subject.Name).to eq('Lilly')
  end
  it 'PostsCounter to be greater than or equal to zero' do
    subject.PostsCounter = nil
    expect(subject).to_not be_valid
  end
  describe 'should check recent three posts are generated' do
    before do
      5.times do |i|
        Post.create(user_id: subject, Title: "#{i} Post")
      end
    end

    it 'should return the 3 most recent posts' do
      expect(subject.recent_three_posts).to eq subject.posts.order(created_at: :desc).limit(3)
    end
  end
end
