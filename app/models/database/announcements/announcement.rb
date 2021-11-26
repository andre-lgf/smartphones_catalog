module Database
  module Announcements
    class Announcement < ApplicationRecord
      validates :price, :amount, presence: { message: "Value must be given" }
      validates :price, :amount, numericality: { only_integer: true }

      belongs_to :device_colors, class_name: "::Database::DeviceColors", foreign_key: :device_color_id
      belongs_to :plan

      has_many :csv_announcements

      has_one :device, class_name: "::Database::Brands::Device", :through => :device_colors
      has_one :brand, class_name: "::Database::Brands::Brand", :through => :device
      has_one :color, :through => :device_colors
    end
  end
end
