module Api
  module V1
    class QuestionAccessesController < ApplicationController

      def create
        question_access_file = File.read(params[:question_access_file].path)

        begin
          question_access = QuestionAccess.insert_all(
            JSON.parse(question_access_file),
            returning: %w[ id times_accessed date question_id ]
          )
        rescue => e
          render json: e.message, status: :internal_server_error and return
        end

        render json: question_access, status: :created
      end
    end
  end
end