require_relative '../rails_helper'
RSpec.describe User, type: :model do
  subject { User.new(Name: 'peter', Photo: 'https://123.com', Bio: 'hello bio', PostsCounter: 1) }
  before { subject.save }
  it 'name should not be blank' do
    subject.Name = nil
    expect(subject).to_not be_valid
  end
  it 'name should not be blank' do
    subject.Name = 'peter'
    expect(subject).to be_valid
  end
  it 'PostsCounter to be greater than or equal to zero' do
    subject.PostsCounter = nil
    expect(subject).to_not be_valid
  end
  it 'expect to return records more than 1' do
    expect(subject).to respond_to(:recent_three_posts)
  end
end
