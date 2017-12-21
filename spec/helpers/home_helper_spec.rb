require 'rails_helper'

RSpec.describe MailHelper, type: :helper do
  it 'returns the number of unread mesages' do
    user1 = FactoryBot.create(:user)
    user2 = User.create!(:email => 'huh@tEsT.com', :username => 'testUser', :password => 'password', :name => 'wILey MaGOo', :home => 'iStANbul' )
    conv = Conversation.create(:sender_id => user1.id, :recipient_id => user2.id)
    message = Message.create(:conversation_id => conv.id, :user_id => user2.id, :content => 'Some content.')
    
    expect(helper.mail_set(user1)).to(eq(1))
    expect(helper.mail_set(user2)).to(eq(0))
  end
end
