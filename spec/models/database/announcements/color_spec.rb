RSpec.describe Database::Announcements::Color do
  let(:instance) { described_class.new }

  it "exists" do
    expect(instance).to be_present
  end

  it "has id field" do
    expect(instance.respond_to?(:id)).to be_truthy
  end

  it "has name field" do
    expect(instance.respond_to?(:name)).to be_truthy
  end

  context "when given mandatory fields values" do
    let(:fields) { { name: 'name' } }

    before do
      described_class.create(**fields)
    end

    it "can be created" do
      expect(described_class.create(**fields)).to be_truthy
    end

    it "can be found" do
      expect(described_class.find_by(name: fields[:name])).to be_truthy
    end

    it "can be updated" do
      record = described_class.find_by(name: fields[:name])
      new_attributes = { name: 'another name'}

      record.update_attributes(**new_attributes)

      expect(record).to have_attributes(new_attributes)
    end

    it "can be deleted" do
      record = described_class.find_by(name: fields[:name])
      id = record.id
      record.destroy

      expect(Database::Announcements::Color.where(id: id).count).to eq(0)
    end
  end
end
