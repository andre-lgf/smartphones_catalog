RSpec.describe Database::Announcements::Plan do
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
    let(:fields) { FactoryBot.create(:plan) }

    it "can be found" do
      expect(described_class.find_by(name: fields.name)).to be_truthy
    end

    it "can be updated" do
      record = described_class.find_by(name: fields.name)
      new_attributes = { name: 'another name'}

      record.update_attributes(**new_attributes)

      expect(record).to have_attributes(new_attributes)
    end
  end
end
