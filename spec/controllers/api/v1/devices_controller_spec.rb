RSpec.describe Api::V1::DevicesController, type: :controller do
  let(:device) { FactoryBot.create(:device) }
  let(:request) { get :index, params: { brand_id: device.brand.id } }
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

    it "responds with an array of devices" do
      expect(response_body).to be_an_instance_of(Array)
    end
  end

  describe "GET #show" do
    let(:request) { get :show, params: { brand_id: device.brand.id, id: device.id } }

    it "is successful" do
      expect(response).to be_success
    end

    it "has HTTP status as 200" do
      expect(response).to have_http_status(200)
    end

    it "responds with single device object" do
      expect(response_body).to be_an_instance_of(Hash)
    end
  end

  describe "POST #create" do
    let(:device_attributes) { { name: "iPhone" } }
    let(:request) { post :create, params: { brand_id: device.brand.id, device: device_attributes } }

    it "is successful" do
      expect(response).to be_success
    end

    it "has HTTP status as 201" do
      expect(response).to have_http_status(201)
    end

    it "responds with json of created object" do
      expect(response_body[:name]).to eql device_attributes[:name]
    end
  end
end
