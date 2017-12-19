module MailHelper
  def mail_set(user)
    userConv = Conversation.userMessages(user.id)
    userMessages = [];
    userConv.each do |c|
      c.messages.unread.each do |m|
        if m.user_id != user.id
          userMessages = userMessages.push(m)
        end
      end
    end
    return userMessages.count
  end
end
