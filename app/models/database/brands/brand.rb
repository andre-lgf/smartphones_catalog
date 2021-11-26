module Database
  module Brands
    class Brand < ApplicationRecord
      validates :name, uniqueness: { case_sensitive: false, message: "Value not unique" }
      validates :name, presence: { message: "Value must be given" }

      has_many :devices, dependent: :delete_all
    end
  end
end
