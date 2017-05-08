require 'rails_helper'
RSpec.describe Api::V1::TeamsController, :type => :controller do
  render_views

  describe "Post #winning_chance" do

    it "responds successfully with an HTTP 200 status code" do
      params = {
        format: :json,
        params: {
          team: {
            name: "Virtus Pro & Ninjas in Pyjamas"
          }
        }
      }
      expected_response = {
        "winning_chance" => 24
      }
      post :winning_chance, params
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response.body).to eq(expected_response.to_json)
    end
  end

end
