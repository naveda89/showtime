FactoryGirl.define do

  factory :user do
    email FFaker::Internet.email
    password FFaker::Internet.password(8)
    password_confirmation { |u| u.password }

    factory :user_with_purchases, parent: :user do
      after(:create) do |user|
        user.purchases << create(:purchase, user_id: user.id)
      end
    end
  end

end
