require 'rails_helper'

RSpec.describe StatusController, type: :controller do

  describe "GET #dj" do
    it "returns http success" do
      get :dj
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #resque" do
    it "returns http success" do
      get :resque
      expect(response).to have_http_status(:success)
    end
  end

end
