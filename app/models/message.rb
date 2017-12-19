class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :content, :conversation_id, :user_id

  scope :unread, -> {
    where("read = false")
  }

  def message_time
    created_at.strftime('%F at %H:%M')
  end
end
