class Conversation < ApplicationRecord
  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'

  has_many :messages, dependent: :destroy

  validates_uniqueness_of :sender_id, :scope => :recipient_id

  scope :between, -> (sender_id, recipient_id) {
    where(sender_id: sender_id, recipient_id: recipient_id).or(where(sender_id: recipient_id, recipient_id: sender_id))
  }

  scope :userMessages, -> (user_id) {
    where(sender_id: user_id).or(where(recipient_id: user_id))
  }
end
