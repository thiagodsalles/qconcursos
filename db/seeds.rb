require 'factory_bot'

10.times do
  question = FactoryBot.create(:question)
  5.times do
    FactoryBot.create(:question_access, question: question)
  end
end
