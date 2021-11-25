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
    let(:csv) { FactoryBot.create(:csv) }
    let(:announcement) { FactoryBot.create(:announcement) }

    let(:fields) { { csv_id: csv.id, announcement_id: announcement.id } }
    
    before do
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