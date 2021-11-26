module Web
  class AnnouncementsController < ApplicationController
    def index
      @announcements ||= announcements
     
      render "announcements/index"
    end

    private

    def announcements
      Database::Announcements::Announcement.all
    end
  end
end