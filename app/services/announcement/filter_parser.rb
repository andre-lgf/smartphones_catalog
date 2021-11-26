module Services
  module Announcements
    class FilterParser
      def initialize(filter)
        @filter = filter
      end

      def call
        res = {}
        res[:plan_id] = plan.id if fully_param?(:plan)
        res[:device_colors] = device_colors if (fully_param?(:brand) || fully_param?(:device) || fully_param?(:color))
        res[:id] = announcements_by_csv if filter[:csv_id].present?

        res
      end

      private

      attr_reader :filter

      def fully_param?(param)
        filter[param.to_sym].present? && filter[param.to_sym][:name].present?
      end

      def plan
        Database::Announcements::Plan.find_by(name: filter[:plan][:name])
      end

      def device_colors
        hash = {}
        hash[:color_id] = color.id if fully_param?(:color)
        hash[:device_id] = device.id if fully_param?(:device)
        hash[:device_id] = device_by_brand if fully_param?(:brand)
        hash
      end

      def device
        Database::Brands::Device.find_by(name: filter[:device][:name])
      end

      def device_by_brand
        Database::Brands::Device.where(brand_id: brand.id).pluck(:id)
      end

      def brand
        Database::Brands::Brand.find_by(name: filter[:brand][:name])
      end

      def color
        Database::Announcements::Color.find_by(name: filter[:color][:name])
      end

      def announcements_by_csv
        Database::Csvs::CsvAnnouncements.where(csv_id: filter[:csv_id].to_i).pluck(:announcement_id)
      end
    end
  end
end