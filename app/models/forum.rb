class Forum < ApplicationRecord
  has_many :forum_messages
  has_many :users, through: :forum_messages

  validates :title, presence: true
  validates :description, presence: true
end
