module Database
  module Csv
    class Csv < ApplicationRecord
      has_many :csv_announcements
      has_many :announcements, through: :csv_announcements
    end
  end
end