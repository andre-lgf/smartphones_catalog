FactoryBot.define do
  factory :announcement, :class => Database::Announcements::Announcement do
    price { 5999 }
    amount { 20 }
    device_colors
    plan
  end
end