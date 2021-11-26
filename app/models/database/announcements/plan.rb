module Database
  module Announcements
    class Plan < ApplicationRecord
      validates :name, presence: { message: "Value must be given" }
      validates :name, inclusion: { in: %w(pre pos), message: "%{value} is not a valid plan" }
      validates :name, uniqueness: { case_sensitive: false, message: "Value not unique" }

      has_many :announcements
    end
  end
end
