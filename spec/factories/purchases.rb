FactoryGirl.define do

  factory :purchase do
    association :user
    association :content_purchase_option

    factory :movie_purchase, parent: :purchase do
      association :content_purchase_option, factory: :movie_purchase_option
    end

    factory :season_purchase, parent: :purchase do
      association :content_purchase_option, factory: :season_purchase_option
    end
  end

end
