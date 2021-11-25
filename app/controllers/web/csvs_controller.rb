module Web
  class CsvsController < ApplicationController
    
    def index
      render json: announcements
    end

    def create
    end
     
    private

    def load_csv
      @load_csv = ::Services::CsvImporter.new({ file: File.read('./input_valid.csv')})
      @load_csv.process
    end

    def announcements
      record_list = load_csv[:data]

      announcements_records = []

      record_list.each { |row| 
        parsed_record = ::Services::Announcements::Parser.new(row).call
        announcements_records.push(parsed_record)
      }

      announcements_records
    end
  end
end