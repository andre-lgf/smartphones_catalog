module Database
  module Csvs
    class CsvAnnouncements < ApplicationRecord
      belongs_to :announcement, class_name: "::Database::Announcements::Announcement"
      belongs_to :csv
    end
  end
end
