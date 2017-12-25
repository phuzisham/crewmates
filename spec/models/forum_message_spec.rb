require 'rails_helper'

describe ForumMessage do
  it { should belong_to :user }
  it { should belong_to :forum }
end
