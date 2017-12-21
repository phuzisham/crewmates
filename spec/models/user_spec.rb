require 'rails_helper'

describe User, 'validation' do
  it { should validate_presence_of :email }
  it { should validate_presence_of :username }
  it { should validate_presence_of :password }
end
