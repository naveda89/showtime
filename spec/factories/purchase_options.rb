FactoryGirl.define do
  factory :purchase_option do
    quality 'hd'

    after(:build) do |purchase_option|
      purchase_option.price = FFaker.numerify '#.##'
    end

    factory :purchase_option_hd, parent: :purchase_option do
      quality 'hd'
    end

    factory :purchase_option_sd, parent: :purchase_option do
      quality 'sd'
    end
  end
end
