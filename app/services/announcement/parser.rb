module Services
  module Announcements
    class Parser
      def initialize(csv_hash)
        @csv_hash = csv_hash
      end

      def call
        {
          plan_id: parse_plan.id,
          device_color_id: parse_device_color.id,
          amount: csv_hash[:quantity].to_i,
          price: csv_hash[:price].to_i
        }.compact
      end

      private

      attr_reader :csv_hash

      def parse_plan
        plan_name = csv_hash[:carrier_plan_type]

        plan = Database::Announcements::Plan.find_or_create_by(name: plan_name)
      end

      def parse_device_color
        ::Services::DeviceColorSearcher.new(csv_hash).call
      end
    end
  end
end
