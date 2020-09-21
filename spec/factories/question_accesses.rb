FactoryBot.define do
  factory :question_access do
    date { rand(1.years).seconds.ago }
    times_accessed { Faker::Number.between(from: 1, to: 1000) }

    question
  end
end
