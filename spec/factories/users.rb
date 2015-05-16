FactoryGirl.define do

  factory :user do
    email FFaker::Internet.email
    password FFaker::Internet.password(8)
    password_confirmation { |u| u.password }
  end

end
