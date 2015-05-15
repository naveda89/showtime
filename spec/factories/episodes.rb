FactoryGirl.define do
  factory :episode do
    season
    sequence(:num)
  end

end
