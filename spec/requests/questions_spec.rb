require 'rails_helper'

RSpec.describe 'Questions', type: :request do
  let!(:question) { create :question }
  let!(:question_access) { create :question_access, question: question }

  describe 'POST /questions' do
    it 'has status code 201' do
      response = HTTP.post(
        'http://localhost:3000/api/v1/questions',
        form: {
          question_file: HTTP::FormData::File.new(file_fixture('questions.json'))
        }
      )
      expect(response.code).to eq(201)
    end
  end

  describe 'GET /questions' do
    context 'with quantity parameters' do
      context 'by year' do
        let(:params) { { quantity: 1, year: question_access.date.year } }

        it 'has status code 200' do
          get api_v1_questions_path, params: params
          expect(response).to have_http_status(200)
        end
        it 'response body' do
          get api_v1_questions_path, params: params
          expect(JSON.parse(response.body).first).to eq(question.as_json)
        end
      end

      context 'by month' do
        let(:params) do
          {
            quantity: 1,
            year: question_access.date.year,
            month: question_access.date.month
          }
        end

        it 'has status code 200' do
          get api_v1_questions_path, params: params
          expect(response).to have_http_status(200)
        end
        it 'response body' do
          get api_v1_questions_path, params: params
          expect(JSON.parse(response.body).first).to eq(question.as_json)
        end
      end

      context 'by week' do
        let(:params) do
          {
            quantity: 1,
            year: question_access.date.year,
            week: question_access.date.strftime('%U').to_i + 1
          }
        end

        it 'has status code 200' do
          get api_v1_questions_path, params: params
          expect(response).to have_http_status(200)
        end
        it 'response body' do
          get api_v1_questions_path, params: params
          expect(JSON.parse(response.body).first).to eq(question.as_json)
        end
      end
    end

    context 'without quantity parameters' do
      context 'by year' do
        let(:params) { { year: question_access.date.year } }

        it 'has status code 200' do
          get api_v1_questions_path, params: params
          expect(response).to have_http_status(200)
        end
        it 'response body' do
          get api_v1_questions_path, params: params
          expect(JSON.parse(response.body).first).to eq(question.as_json)
        end
      end

      context 'by month' do
        let(:params) { { year: question_access.date.year, month: question_access.date.month } }

        it 'has status code 200' do
          get api_v1_questions_path, params: params
          expect(response).to have_http_status(200)
        end
        it 'response body' do
          get api_v1_questions_path, params: params
          expect(JSON.parse(response.body).first).to eq(question.as_json)
        end
      end

      context 'by week' do
        let(:params) do
          { year: question_access.date.year, week: question_access.date.strftime('%U').to_i + 1 }
        end

        it 'has status code 200' do
          get api_v1_questions_path, params: params
          expect(response).to have_http_status(200)
        end
        it 'response body' do
          get api_v1_questions_path, params: params
          expect(JSON.parse(response.body).first).to eq(question.as_json)
        end
      end
    end
  end
end
