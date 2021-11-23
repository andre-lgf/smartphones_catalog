module Database
  module Announcements
    class Plan < ApplicationRecord
      has_many :announcements
    end
  end
end
