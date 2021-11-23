RSpec.describe Database::Announcements::Announcement do
  let(:instance) { described_class.new }

  it "exists" do
    expect(instance).to be_present
  end

  it "has id field" do
    expect(instance.respond_to?(:id)).to be_truthy
  end

  it "has price field" do
    expect(instance.respond_to?(:price)).to be_truthy
  end

  it "has amount field" do
    expect(instance.respond_to?(:amount)).to be_truthy
  end

  it "has device_id field" do
    expect(instance.respond_to?(:device_id)).to be_truthy
  end

  it "has color_id field" do
    expect(instance.respond_to?(:color_id)).to be_truthy
  end

  it "has plan_id field" do
    expect(instance.respond_to?(:plan_id)).to be_truthy
  end

  context "when given mandatory fields values" do
    let(:brand_data) { { id: 2, name: 'Morotola' } }
    let(:device_data) { { name: 'Moto G5 16GB', brand_id: brand_data[:id] } }
    let(:color_data) { { id: 4, name: 'Vermelho' } }
    let(:plan_data) { { id: 2, name: 'pos' } }
    let(:device) { Database::Brands::Device.where(brand_id: brand_data[:id]).first }

    let(:fields) { { amount: 80, price: 2999, color_id: color_data[:id], plan_id: plan_data[:id], device_id: device.id } }
    
    before do
      Database::Brands::Brand.create(brand_data)
      Database::Brands::Device.create(device_data)
      Database::Announcements::Color.create(color_data)
      Database::Announcements::Plan.create(plan_data)

      described_class.create(**fields)
    end

    it "can be created" do
      expect(described_class.create(**fields)).to be_truthy
    end

    it "can be found" do
      expect(described_class.find_by(price: fields[:price])).to be_truthy
    end

    it "can be updated" do
      record = described_class.find_by(price: fields[:price])
      new_attributes = { price: 1999 }

      record.update_attributes(**new_attributes)

      expect(record).to have_attributes(new_attributes)
    end

    it "can be deleted" do
      record = described_class.find_by(price: fields[:price])
      id = record.id
      record.destroy

      expect(Database::Announcements::Announcement.where(id: id).count).to eq(0)
    end
  end
end
