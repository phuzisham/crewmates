require 'rails_helper'

describe User, 'before_validation' do
  user = User.create(:email => 'TeSt@tEsT.com', :username => 'testUser', :password => 'password', :name => 'wILey MaGOo', :home => 'iStANbul' )

  it 'will lowcase email' do
    expect(user.email).to(eq('test@test.com'))
  end

  it 'will titleize name' do
    expect(user.name).to(eq('Wiley Magoo'))
  end

  it 'will titleize home' do
    expect(user.home).to(eq('Istanbul'))
  end
end

describe User, 'validation' do
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { should validate_presence_of :username }
  it { should validate_uniqueness_of(:username).ignoring_case_sensitivity }
  it { should validate_presence_of :password }
  it { should validate_confirmation_of :password }
end

describe User, 'associations' do
  it { should have_many :conversations }
  it { should have_many :messages }
end
