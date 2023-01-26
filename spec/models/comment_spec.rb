require_relative '../rails_helper'
RSpec.describe Comment, type: :model do
  subject { Comment.new(Text: 'follow the spirit') }
  it 'expect to respond to the method update_comment_counter' do
    expect(subject).to respond_to(:update_comment_counter)
  end
end
