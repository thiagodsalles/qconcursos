FactoryBot.define do
  factory :question do
    statement { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
    answer { %w[A B C D E].sample }
    daily_access { 1000 }
    discipline { %w[portugues geografia matematica historia ingles].sample }
    created_at { rand(1.years).seconds.ago }
  end
end
