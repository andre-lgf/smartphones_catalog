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
      data ||= load_csv

      uploader = ::Services::Announcements::Uploader.new({ record_list: data[:data], csv_id: data[:id]})
      uploader.call
    end
  end
end