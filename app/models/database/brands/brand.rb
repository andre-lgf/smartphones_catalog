module Database
  module Brands
    class Brand < ApplicationRecord
      has_many :devices, dependent: :delete_all
    end
  end
end
