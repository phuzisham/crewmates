class ForumMessage < ApplicationRecord
  belongs_to :user
  belongs_to :forum

  validates :title, presence: true
  validates :body, presence: true
end
