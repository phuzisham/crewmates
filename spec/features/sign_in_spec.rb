require 'rails_helper'

describe 'test for sign-in process' do
  before(:each) do
    FactoryBot.create(:user)
    visit new_user_session_url
    fill_in 'Username', :with => 'test'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'
  end

  it 'will let user sign in' do
    expect(page).to have_content "Signed in successfully."
  end

  it 'will let user sign out' do
    click_link 'Logout'
    expect(page).to have_content "Signed out successfully."
  end
end
