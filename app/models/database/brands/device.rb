module Database
  module Brands
    class Device < ApplicationRecord
      validates :brand_id, :name, presence: true
      validates :name, uniqueness: { case_sensitive: false, message: "Value not unique" }

      belongs_to :brand
      has_many :device_colors
      has_many :colors, through: :device_colors
    end
  end
end
