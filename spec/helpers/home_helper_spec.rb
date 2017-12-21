require 'rails_helper'

RSpec.describe MailHelper, type: :helper do
  it 'returns the number of unread mesages' do
    user = FactoryBot.create(:user)
    expect(helper.mail_set(user)).to(eq(0))
  end
end
