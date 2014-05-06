require 'spec_helper'

describe AssetsController do
  describe "GET #index" do
    before { get :index }
    
    it "200 status code" do
      expect(response.status).to eq(200)
    end
    
    it "render the index template" do
      expect(response).to render_template("index")
    end
  end
end
