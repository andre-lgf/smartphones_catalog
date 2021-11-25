FactoryBot.define do
  factory :brand, :class => Database::Brands::Brand do
    name { "Samsung" }
  end
end