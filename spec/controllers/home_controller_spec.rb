require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET user" do
    it "renders the user template" do
      user = FactoryBot.create(:user)
      get(:user, params: { id: user.id })
      expect(response).to render_template("user")
    end
  end
end
