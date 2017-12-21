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

  def mail_count(user1, user2)
    userConv = Conversation.userMessages(user1.id)
    userMessages = [];
    userConv.each do |c|
      c.messages.unread.each do |m|
        if m.user_id != user1.id && m.user_id == user2.id
          userMessages = userMessages.push(m)
        end
      end
    end
    return userMessages.count
  end
end
