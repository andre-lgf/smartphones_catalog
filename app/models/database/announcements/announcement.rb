module Database
  module Announcements
    class Announcement < ApplicationRecord
      belongs_to :device_colors, class_name: "::Database::DeviceColors", foreign_key: :device_color_id
      belongs_to :plan

      has_many :csv_announcements
    end
  end
end
