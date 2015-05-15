FactoryGirl.define do

  factory :content do
    title { FFaker::Name.name }
    plot  { FFaker::Lorem.paragraph(4) }

  end

end
