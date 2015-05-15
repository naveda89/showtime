FactoryGirl.define do

  factory :season, parent: :content, class: 'Season' do

    factory :season_with_episodes do
      transient do
        episodes_count 12
      end

      after(:create) do |season, evaluator|
        create_list(:episode, evaluator.episodes_count, season: season)
      end
    end

  end

end
