module Web
  class CsvsController < ApplicationController
    
    def index
      render "csvs/index"
    end

    def create
    end

    def import
      render json: announcements(params[:file].path)
    end
     
    private

    def load_csv(path)
      @load_csv = ::Services::CsvImporter.new({ file: path})
      @load_csv.process
    end

    def announcements(path)
      data ||= load_csv(path)

      uploader = ::Services::Announcements::Uploader.new({ record_list: data[:data], csv_id: data[:id]})
      uploader.call
    end
  end
end