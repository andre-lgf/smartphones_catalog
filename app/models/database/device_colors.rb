module Database
  class DeviceColors < ApplicationRecord
    validates :device_id, :color_id, presence: true
    
    belongs_to :device, class_name: "::Database::Brands::Device"
    belongs_to :color, class_name: "::Database::Announcements::Color"
  end
end
