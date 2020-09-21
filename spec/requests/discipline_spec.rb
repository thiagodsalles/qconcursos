require 'rails_helper'

RSpec.describe 'Disciplines', type: :request do
  let!(:question) { create :question }
  let!(:question_access) { create :question_access, question: question }
  let!(:question_two) { create :question }
  let!(:question_access_two) { create :question_access, question: question_two }

  describe 'GET /disciplines' do
    it 'has status code 200' do
      get api_v1_disciplines_path
      expect(response).to have_http_status(200)
    end
    it 'response body' do
      get api_v1_disciplines_path
      disciplines = Question.all.map(&:discipline)
      expect(JSON.parse(response.body)).to eq(disciplines.uniq)
    end
  end
end


