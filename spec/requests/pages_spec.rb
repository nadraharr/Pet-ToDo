require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /today" do
    it "should render today page" do
      get today_path
      expect(response).to have_http_status(200)
      expect(response).to render_template :today
    end
  end

  describe "GET /later" do
    it "should render later page" do
      get later_path
      expect(response).to have_http_status(200)
      expect(response).to render_template :later
    end
  end

  describe "GET /everyday" do
    it "should render everyday page" do
      get everyday_path
      expect(response).to have_http_status(200)
      expect(response).to render_template :everyday
    end
  end
end
