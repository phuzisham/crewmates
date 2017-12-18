require 'rails_helper'

describe User, 'validation' do
  it { should validate_presence_of :username }
end
