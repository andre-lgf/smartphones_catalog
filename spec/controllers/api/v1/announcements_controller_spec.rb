RSpec.describe Api::V1::AnnouncementsController, type: :controller do
  let(:announcement) { FactoryBot.create(:announcement) }
  let(:plan) { FactoryBot.create(:plan) }
  let(:device_colors) { FactoryBot.create(:device_colors) }
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

    it "responds with an array of announcements" do
      expect(response_body).to be_an_instance_of(Array)
    end
  end

  describe "GET #show" do
    let(:request) { get :show, params: { id: announcement.id } }

    it "is successful" do
      expect(response).to be_success
    end

    it "has HTTP status as 200" do
      expect(response).to have_http_status(200)
    end

    it "responds with single announcement object" do
      expect(response_body).to be_an_instance_of(Hash)
    end
  end

  describe "POST #create" do
    let(:pos_plan) { FactoryBot.create(:pos_plan) }
    let(:announcement_attributes) { { plan_id: pos_plan.id, device_color_id: device_colors.id, price: 288, amount: 10 } }
    let(:request) { post :create, params: { announcement: announcement_attributes } }

    it "is successful" do
      expect(response).to be_success
    end

    it "has HTTP status as 201" do
      expect(response).to have_http_status(201)
    end
  end
end
