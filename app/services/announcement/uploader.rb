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

      attr_reader :record_list, :csv_id

      def announcements
        record_list.map { |row| register_announcement(row) }
      end

      def register_announcement(record)
        parsed_record = ::Services::Announcements::Parser.new(record).call
        database_record = Database::Announcements::Announcement.find_or_create_by(parsed_record)

        params = csv_announcement_params(database_record.id)
        Database::Csvs::CsvAnnouncements.find_or_create_by(params)

        parsed_record
      end

      def csv_announcement_params(record_id)
        {
          csv_id: csv_id,
          announcement_id: record_id
        }
      end
    end
  end
end