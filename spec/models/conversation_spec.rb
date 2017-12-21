require 'rails_helper'

describe Conversation, 'associations' do
  it { should belong_to :sender }
  it { should belong_to :recipient }
  it { should have_many :messages }
end

describe Conversation, 'validation' do
  it { should validate_uniqueness_of(:sender_id).scoped_to(:recipient_id) }
end
