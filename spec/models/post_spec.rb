require_relative '../rails_helper'
RSpec.describe Post, type: :model do
  subject { Post.new(Title: 'men', Text: 'will', CommentsCounter: 1, LikesCounter: 1) }
  before { subject.save }
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
  it 'expect to respond to method' do
    expect(subject).to respond_to(:update_user_counter)
  end
end
