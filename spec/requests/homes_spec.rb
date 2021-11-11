require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /top" do
    it "returns http success" do
      get "/homes/top"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /introduction" do
    it "returns http success" do
      get "/homes/introduction"
      expect(response).to have_http_status(:success)
    end
  end

end
