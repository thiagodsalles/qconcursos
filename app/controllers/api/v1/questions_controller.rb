module Api
  module V1
    class QuestionsController < ApplicationController
      def index
        questions_result = QuestionSearchQuery.new(params).call

        render json: questions_result, status: :ok
      end

      def create
        question_file = File.read(params[:question_file].path)

        begin
          question = Question.insert_all(
            JSON.parse(question_file),
            returning: %w[id statement text answer daily_access discipline created_at]
          )
        rescue StandardError => e
          render json: e.message, status: :internal_server_error and return
        end

        render json: question, status: :created
      end
    end
  end
end
