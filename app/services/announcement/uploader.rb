module Services
  module Announcements
    class Uploader
      def initialize(options)
        @record_list = options[:record_list]
        @csv_id = options[:csv_id]
      end

      def call
        announcements
      end

      private

      attr_reader :record_list

      def announcements
        record_list.map { |row| 
          parsed_record = ::Services::Announcements::Parser.new(row).call
          Database::Announcements::Announcement.find_or_create_by(parsed_record)

          parsed_record
        }
      end   
    end
  end
end