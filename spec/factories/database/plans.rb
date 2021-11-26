FactoryBot.define do
  factory :plan, :class => Database::Announcements::Plan do
    name { "pre" }
  end

  factory :pos_plan, :class => Database::Announcements::Plan do
    name { "pos" }
  end
end