module Database
  module Csvs
    class CsvAnnouncements < ApplicationRecord
      validates :csv_id, :announcement_id, presence: true
      
      belongs_to :announcement, class_name: "::Database::Announcements::Announcement"
      belongs_to :csv
    end
  end
end
