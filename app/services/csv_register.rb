module Services
  class CsvRegister
    def initialize(name)
      @name = name
    end

    def call
      register_csv
      @csv_record
    end

    private

    def register_csv
      begin
        @csv_record = ::Database::Csvs::Csv.find_or_create_by(name: @name)
      rescue StandardError => e
        { error: e.to_s }
      end
    end
  end
end