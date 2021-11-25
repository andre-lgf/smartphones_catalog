module Database
  module Announcements
    class Color < ApplicationRecord
      has_many :device_colors
      has_many :devices, through: :device_colors
    end
  end
end
