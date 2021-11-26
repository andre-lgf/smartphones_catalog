module Database
  module Announcements
    class Announcement < ApplicationRecord
      belongs_to :device_colors, class_name: "::Database::DeviceColors", foreign_key: :device_color_id
      belongs_to :plan

      has_many :csv_announcements

      has_one :device, :through => :device_colors, class_name: "::Database::Brands::Device"
      has_one :color, :through => :device_colors, class_name: "::Database::Announcements::Color"
      has_one :brand, :through => :device, class_name: "::Database::Brands::Brand"
    end
  end
end
