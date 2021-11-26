module Services
  module Announcements
    class FilterParser
      def initialize(filter)
        @filter = filter
      end

      def call
        res = {}
        res[:plan_id] = plan.id if filter[:plan].present?
        res[:device_colors] = device_colors if filter[:device].present? || filter[:color].present?
        res[:brand] = brand.id if filter[:brand].present?

        res
      end

      private

      attr_reader :filter

      def plan
        Database::Announcements::Plan.find_by(name: filter[:plan][:name])
      end

      def device_colors
        hash = {}
        hash[:device_id] = device.id if filter[:device].present?
        hash[:color_id] = color.id if filter[:color].present?
      end

      def device
        Database::Brands::Device.find_by(name: filter[:device][:name])
      end

      def color
        Database::Announcements::Color.find_by(name: filter[:color][:name])
      end

      def brand
        Database::Brands::Brand.find_by(name: filter[:brand][:name])
      end
    end
  end
end