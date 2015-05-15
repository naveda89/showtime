FactoryGirl.define do
  factory :purchase_option do
    price FFaker.numerify '#.##'
    quality 'hd'

    factory :purchase_option_hd, parent: :purchase_option do
      quality 'hd'
    end

    factory :purchase_option_sd, parent: :purchase_option do
      quality 'sd'
    end
  end
end
