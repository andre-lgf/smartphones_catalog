RSpec.describe Database::DeviceColors do
  let(:instance) { described_class.new }

  it "exists" do
    expect(instance).to be_present
  end

  it "has id field" do
    expect(instance.respond_to?(:id)).to be_truthy
  end

  it "has color_id field" do
    expect(instance.respond_to?(:color_id)).to be_truthy
  end

  it "has device_id field" do
    expect(instance.respond_to?(:device_id)).to be_truthy
  end

  context "when given mandatory fields values" do
    let(:device_colors) { FactoryBot.create(:device_colors) }
    let(:fields) { { color_id: 1, device_id: 1 } }
    
    it "can be created" do
      expect(described_class.create(**fields)).to be_truthy
    end

    it "can be found" do
      expect(described_class.find(device_colors.id)).to be_truthy
    end

    it "can be deleted" do
      record = described_class.find(device_colors.id)
      id = record.id
      record.destroy

      expect(Database::DeviceColors.where(id: id).count).to eq(0)
    end
  end
end
