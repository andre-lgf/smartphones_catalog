RSpec.describe Services::CsvImporter do
  let(:file_path) { "tmp/test.csv" }
  let(:csv) { File.read('./input_valid.csv') }
  let(:subject) { described_class.new({ file: csv }) }

  describe "CsvImporter#process" do
    context "given valid csv file" do
      it "is successful" do
        expect(subject.process).to be_an_instance_of(Hash)
      end

      it "returns array of entries" do
        expect(subject.process[:data]).to be_an_instance_of(Array)
      end

      it "returns truthy array of entries" do
        expect(subject.process[:data]).to be_truthy
      end
    end
  end
end
