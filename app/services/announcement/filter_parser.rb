module Services
  module Announcements
    class FilterParser
      def initialize(filter)
        @filter = filter
      end

      def call
        res = {}
        res[:plan_id] = plan.id if fully_param?(:plan)
        res[:device_colors] = device_colors if (fully_param?(:device) || fully_param?(:color))

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
        hash
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