module Services
  class DeviceColorSearcher
    def initialize(csv_hash)
      @csv_hash = csv_hash
    end

    def call
      begin
        Database::DeviceColors.find_or_create_by(color_id: color.id, device_id: device.id)
      rescue StandardError => e
        { error: e.to_s }
      end
    end

    private

    attr_reader :csv_hash

    def color
      color_name = csv_hash[:color]

      color = Database::Announcements::Color.find_or_create_by(name: color_name)
    end

    def device
      device_name = csv_hash[:model]
      
      device = Database::Brands::Device.find_or_create_by(name: device_name, brand_id: brand.id )
    end

    def brand
      brand_name = csv_hash[:manufacturer]
      
      brand = Database::Brands::Brand.find_or_create_by(name: brand_name)
    end
  end
end
