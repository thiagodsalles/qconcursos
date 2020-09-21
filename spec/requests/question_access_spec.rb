require 'rails_helper'

RSpec.describe 'QuestionAccess', type: :request do
  describe 'POST /question_accesses' do
    it 'has status code 201' do
      response = HTTP.post(
        'http://localhost:3000/api/v1/question_accesses',
        form: {
          question_access_file: HTTP::FormData::File.new(file_fixture('question_access.json'))
        }
      )
      expect(response.code).to eq(201)
    end
  end
end


