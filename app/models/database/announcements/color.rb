module Database
  module Announcements
    class Color < ApplicationRecord
      validates :name, presence: { message: "Value must be given" }
      validates :name, uniqueness: { case_sensitive: false, message: "Value not unique" }

      has_many :device_colors
      has_many :devices, through: :device_colors
    end
  end
end
