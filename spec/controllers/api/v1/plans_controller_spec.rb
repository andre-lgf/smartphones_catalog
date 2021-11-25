RSpec.describe Api::V1::PlansController, type: :controller do
  let(:plan) { FactoryBot.create(:plan) }
  let(:request) { get :index }
  let(:response_body) { JSON.parse(response.body, symbolize_names: true) }

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

    it "responds with an array of plans" do
      expect(response_body).to be_an_instance_of(Array)
    end
  end

  describe "GET #show" do
    let(:request) { get :show, params: { id: plan.id } }

    it "is successful" do
      expect(response).to be_success
    end

    it "has HTTP status as 200" do
      expect(response).to have_http_status(200)
    end

    it "responds with single plan object" do
      expect(response_body).to be_an_instance_of(Hash)
    end
  end

  describe "POST #create" do
    let(:plan_attributes) { { name: "pos" } }
    let(:request) { post :create, params: { plan: plan_attributes } }

    it "is successful" do
      expect(response).to be_success
    end

    it "has HTTP status as 201" do
      expect(response).to have_http_status(201)
    end

    it "responds with json of created object" do
      expect(response_body[:name]).to eql plan_attributes[:name]
    end
  end
end
