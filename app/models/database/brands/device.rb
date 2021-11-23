module Database
  module Brands
    class Device < ApplicationRecord
      belongs_to :brand
      has_many :announcements
    end
  end
end
