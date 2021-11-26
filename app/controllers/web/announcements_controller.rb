module Web
  class AnnouncementsController < ApplicationController
    def index
      if (parsed_filter.present?)
        @announcements = filtered_announcements
      else
        @announcements = announcements
      end

      render "announcements/index"
    end

    private

    def parsed_filter
      Services::Announcements::FilterParser.new(params).call
    end

    def announcements
      Database::Announcements::Announcement.all
    end

    def filtered_announcements
      Database::Announcements::Announcement.joins(:device, :color, :csv_announcements).where(parsed_filter)
    end
  end
end