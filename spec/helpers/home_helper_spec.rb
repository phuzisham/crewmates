require 'rails_helper'

RSpec.describe MailHelper, type: :helper do
  before(:each) do
    User.destroy_all
    @user1 = FactoryBot.create(:user)
    @user2 = User.create!(:email => 'huh@tEsT.com', :username => 'testUser', :password => 'password', :name => 'wILey MaGOo', :home => 'iStANbul' )
    conv = Conversation.create(:sender_id => @user1.id, :recipient_id => @user2.id)
    message = Message.create(:conversation_id => conv.id, :user_id => @user2.id, :content => 'Some content.')
  end

  it 'returns the number of unread mesages for user' do
    expect(helper.mail_set(@user1)).to(eq(1))
    expect(helper.mail_set(@user2)).to(eq(0))
  end


  it 'returns the number of unread mesages for user1 from specific user2' do
    expect(helper.mail_count(@user1, @user2)).to(eq(1))
    expect(helper.mail_count(@user2, @user1)).to(eq(0))
  end
end
