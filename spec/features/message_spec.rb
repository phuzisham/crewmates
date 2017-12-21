require 'rails_helper'

describe 'test for messages' do
  before(:each) do
    User.destroy_all
    FactoryBot.create(:user)
    user = User.create!(:email => 'huh@tEsT.com', :username => 'testUser', :password => 'password', :name => 'wILey MaGOo', :home => 'iStANbul' )
    visit new_user_session_url
    fill_in 'Username', :with => 'test'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'
  end

  it 'will let user sign in' do
    click_link 'Mailbox (0)'
    click_link 'Message me!'
    fill_in 'message_content', :with => 'This is a message.'
    click_button 'Create Message'
    expect(page).to(have_content('This is a message.'))
  end

end
