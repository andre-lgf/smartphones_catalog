module Services
  class CsvImporter
    def initialize(options = {})
      @csv = options[:file]
      @headers = options[:headers] || true
    end

    def process
      raise StandardError.new "Given no CSV files" unless @csv.present?
      
      response
    end

    private

    def response
      {
        data: entries_list
      }
    end

    def entries_list
      list = []
  
      CSV.parse(@csv, headers: @headers).each do |row|
        data = row.to_h
        list.push(data.symbolize_keys)
      end
  
      list
    end
  end
end