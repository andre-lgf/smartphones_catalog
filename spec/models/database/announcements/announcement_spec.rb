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

  it "has device_color_id field" do
    expect(instance.respond_to?(:device_color_id)).to be_truthy
  end

  it "has plan_id field" do
    expect(instance.respond_to?(:plan_id)).to be_truthy
  end

  context "when given mandatory fields values" do
    let(:announcement) { FactoryBot.create(:announcement) }
    let(:fields) { { amount: 80, price: 2999 } }
    
    it "can be created" do
      expect(described_class.create(**fields)).to be_truthy
    end

    it "can be found" do
      expect(described_class.find(announcement.id)).to be_truthy
    end

    it "can be updated" do
      record = described_class.find(announcement.id)
      new_attributes = { price: 1999 }

      record.update_attributes(**new_attributes)

      expect(record).to have_attributes(new_attributes)
    end

    it "can be deleted" do
      record = described_class.find(announcement.id)
      id = record.id
      record.destroy

      expect(Database::Announcements::Announcement.where(id: id).count).to eq(0)
    end
  end
end
