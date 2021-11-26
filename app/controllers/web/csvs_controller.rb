module Web
  class CsvsController < ApplicationController
    before_action :announcements, only: [:import]
    
    def index
      render "csvs/index"
    end

    def import
      redirect_to :action => "show", :id => @csv_filter[:id]
    end

    def show
      @announcements = filtered_announcements
      @csv_filter = { name: Database::Csvs::Csv.find(params[:id]).name }

      render "announcements/index"
    end
     
    private

    def announcements
      data ||= load_csv
      @csv_filter = { id: data[:id] }

      uploader = ::Services::Announcements::Uploader.new({ record_list: data[:data], csv_id: data[:id]})
      uploader.call
    end

    def load_csv
      @load_csv = ::Services::CsvImporter.new({ file: params[:file].path, name: params[:file].original_filename })
      @load_csv.process
    end

    def parsed_filter
      Services::Announcements::FilterParser.new(params).call
    end

    def filtered_announcements
      Database::Announcements::Announcement.by_csv(params[:id]).joins(:device, :color, :csv_announcements).where(parsed_filter)
    end
  end
end