FactoryBot.define do
  factory :device, :class => Database::Brands::Device do
    name { "Galaxy S5 48GB" }
    brand
  end
end
