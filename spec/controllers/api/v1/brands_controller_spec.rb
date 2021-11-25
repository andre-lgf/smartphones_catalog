RSpec.describe Api::V1::BrandsController, type: :controller do
  let(:request) { get :index }
  let(:response_body) { JSON.parse(response.body) }

  before(:each) do
    request
  end

  describe "GET #index" do
    it "is successful" do
      expect(response).to be_success
    end

    it "has HTTP status as 200" do
      expect(response).to have_http_status(200)
    end

    it "responds with an array of questions" do
      expect(response_body).to be_an_instance_of(Array)
    end
  end
end