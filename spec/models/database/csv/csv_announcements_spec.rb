RSpec.describe Database::Csvs::CsvAnnouncements do
  let(:instance) { described_class.new }

  it "exists" do
    expect(instance).to be_present
  end

  it "has id field" do
    expect(instance.respond_to?(:id)).to be_truthy
  end

  it "has csv_id field" do
    expect(instance.respond_to?(:csv_id)).to be_truthy
  end

  it "has announcement_id field" do
    expect(instance.respond_to?(:announcement_id)).to be_truthy
  end

  context "when given mandatory fields values" do
    let(:brand_data) { { id: 2, name: 'Morotola' } }
    let(:device_data) { { name: 'Moto G5 16GB', brand_id: brand_data[:id] } }
    let(:color_data) { { id: 4, name: 'Vermelho' } }
    let(:plan_data) { { id: 2, name: 'pos' } }
    let(:csv_data) { { id: 3, name: 'csv' } }
    let(:announcement_data) { { amount: 80, price: 2999, color_id: color_data[:id], plan_id: plan_data[:id], device_id: device.id } }

    let(:device) { Database::Brands::Device.where(brand_id: brand_data[:id]).first }
    let(:csv) { Database::Csvs::Csv.where(id: csv_data[:id]).first }
    let(:announcement) { Database::Announcements::Announcement.where(price: announcement_data[:price]).first }

    let(:fields) { { csv_id: csv.id, announcement_id: announcement.id } }
    
    before do
      Database::Brands::Brand.create(brand_data)
      Database::Brands::Device.create(device_data)
      Database::Announcements::Color.create(color_data)
      Database::Announcements::Plan.create(plan_data)
      Database::Announcements::Announcement.create(announcement_data)
      Database::Csvs::Csv.create(csv_data)

      described_class.create(**fields)
    end

    it "can be created" do
      expect(described_class.create(**fields)).to be_truthy
    end

    it "can be found" do
      expect(described_class.find_by(csv_id: fields[:csv_id])).to be_truthy
    end

    it "can be deleted" do
      record = described_class.find_by(csv_id: fields[:csv_id])
      id = record.id
      record.destroy

      expect(Database::Csvs::Csv.where(id: id).count).to eq(0)
    end
  end
end