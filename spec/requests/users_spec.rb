require 'rails_helper'

RSpec.describe "Users", type: :request do
    describe "GET /users/new" do
        it "should render users/new page" do
            get new_user_path
            expect(response).to have_http_status(200)
            expect(response).to render_template :new
        end
    end  
end
