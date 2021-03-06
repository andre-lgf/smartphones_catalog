module Services
  class CsvImporter
    TOTAL_COLLUMS = 6

    def initialize(options = {})
      @csv = options[:file]
      @headers = options[:headers] || true
      @name = options[:name] || 'csv'
    end

    def process
      raise StandardError.new "Given no CSV files" unless @csv.present?
      
      response
    end

    private

    def response
      {
        data: entries_list,
        name: csv_record[:name],
        id: csv_record[:id]
      }
    end

    def entries_list
      list = []
  
      CSV.foreach(@csv, headers: @headers).each do |row|
        data = row.to_h.compact

        raise StandardError.new "Wrong CSV format" if data.size != 6

        list.push(data.symbolize_keys)
      end
  
      list
    end

    def csv_record
      ::Services::CsvRegister.new(@name).call
    end
  end
end