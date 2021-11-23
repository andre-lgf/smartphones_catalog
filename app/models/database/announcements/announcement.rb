module Database
  module Announcements
    class Announcement < ApplicationRecord
      belongs_to :device, class_name: "::Database::Brands::Device"
      belongs_to :plan
      belongs_to :color
    end
  end
end
