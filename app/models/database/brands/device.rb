module Database
  module Brands
    class Device < ApplicationRecord
      belongs_to :brand
      has_many :device_colors
      has_many :colors, through: :device_colors
    end
  end
end
