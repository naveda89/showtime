FactoryGirl.define do

  factory :content_purchase_option do
    association :content
    association :purchase_option
    active true

    after(:build) do |content_purchase_option|
      content_purchase_option.price = content_purchase_option.purchase_option_price
    end

    factory :inactive_content_purchase_option, parent: :content_purchase_option do
      active false
    end
  end

end
