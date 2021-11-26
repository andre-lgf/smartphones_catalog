module Database
  module Csvs
    class Csv < ApplicationRecord
      validates :name, presence: true

      has_many :csv_announcements
      has_many :announcements, through: :csv_announcements
    end
  end
end
