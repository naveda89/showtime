FactoryGirl.define do

  factory :purchase do
    association :user, factory: :user
    association :content_purchase_option
  end

end
