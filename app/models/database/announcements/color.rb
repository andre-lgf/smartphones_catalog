module Database
  module Announcements
    class Color < ApplicationRecord
      has_many :announcements
    end
  end
end
