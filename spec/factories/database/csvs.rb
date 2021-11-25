FactoryBot.define do
  factory :csv, :class => Database::Csvs::Csv do
    name { "my_file" }
  end
end