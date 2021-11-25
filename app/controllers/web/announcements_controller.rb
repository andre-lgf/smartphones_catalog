module Web
  class AnnouncementsController < ApplicationController
    def index
      render "announcements/index"
    end

    private
  end
end