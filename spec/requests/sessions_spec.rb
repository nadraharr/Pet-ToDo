require 'rails_helper'

RSpec.describe "Sessions", type: :request do
    describe "GET /sessions/new" do
        it "should render sessions/new page" do
            get new_session_path
            expect(response).to have_http_status(200)
            expect(response).to render_template :new
        end
    end
end
