require 'rails_helper'

describe Message, 'associations' do
  it { should belong_to :conversation }
  it { should belong_to :user }
end

describe Message, 'validation' do
  it { should validate_presence_of :content }
  it { should validate_presence_of :conversation_id }
  it { should validate_presence_of :user_id }
end

describe Message, 'message_time' do
  user1 = FactoryBot.create(:user)
  user2 = User.create!(:email => 'huh@tEsT.com', :username => 'testUser', :password => 'password', :name => 'wILey MaGOo', :home => 'iStANbul' )
  conv = Conversation.create(:sender_id => user1.id, :recipient_id => user2.id)
  message = Message.new(:conversation_id => conv.id, :user_id => user2.id, :content => 'Some content.', :created_at => '2017-12-19 07:10:14')

  it 'will return formatted time' do
    expect(message.message_time).to(eq('2017-12-19 at 07:10'))
  end
end
