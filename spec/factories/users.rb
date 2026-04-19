FactoryBot.define do
  factory :user do
    name     { Faker::Name.name }
    email    { Faker::Internet.unique.email }
    password { "password123" }
  end
end

# spec/factories/posts.rb
FactoryBot.define do
  factory :post do
    title     { Faker::Lorem.sentence(word_count: 4) }
    body      { Faker::Lorem.paragraphs(number: 3).join("\n\n") }
    published { false }
    association :user  # User 팩토리를 사용해 연관 객체 자동 생성

    # Trait: 특정 상태를 재사용 가능한 그룹으로 정의
    trait :published do
      published { true }
    end

    trait :with_comments do
      after(:create) do |post|
        create_list(:comment, 3, post: post)
      end
    end
  end
end