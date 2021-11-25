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
        record_list.map { |row| 
          parsed_record = ::Services::Announcements::Parser.new(row).call
          register_announcement(parsed_record)
        }
      end

      def register_announcement(record)
        database_record = Database::Announcements::Announcement.find_or_create_by(record)
        build_csv_announcement(database_record.id) if @csv_id.present?

        database_record
      end

      def build_csv_announcement(id)
        params = csv_announcement_params(id)
        Database::Csvs::CsvAnnouncements.find_or_create_by(params)
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