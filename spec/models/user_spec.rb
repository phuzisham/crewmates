require 'rails_helper'



RSpec.describe User do
  before(:each) do
    FactoryBot.create(:user)
  end
  it { should validate_presence_of :email }
  it { should validate_presence_of :username }
  it { should validate_presence_of :password }
end
