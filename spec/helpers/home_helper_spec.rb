require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MailHelper, type: :helper do
  it 'returns the number of unread mesages' do
    user = FactoryBot.create(:user)
    expect(helper.mail_set(user)).to(eq(0))
  end
end
