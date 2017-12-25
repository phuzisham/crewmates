require 'rails_helper'

describe Forum do
  it { should have_many :users }
  it { should have_many :forum_messages }
end
