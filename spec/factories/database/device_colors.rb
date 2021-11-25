FactoryBot.define do
  factory :device_colors, :class => Database::DeviceColors do
    device
    color
  end
end