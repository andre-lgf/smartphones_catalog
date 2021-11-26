module Web
  class CsvsController < ApplicationController
    
    def index
      render "csvs/index"
    end

    def import
      render json: announcements
    end
     
    private

    def load_csv
      @load_csv = ::Services::CsvImporter.new({ file: params[:file].path, name: params[:file].original_filename })
      @load_csv.process
    end

    def announcements
      data ||= load_csv

      uploader = ::Services::Announcements::Uploader.new({ record_list: data[:data], csv_id: data[:id]})
      uploader.call
    end
  end
end