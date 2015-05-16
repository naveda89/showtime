FactoryGirl.define do
  factory :episode do
    season
    sequence(:num)
    plot { FFaker::Lorem.paragraph(4) }
  end
end
